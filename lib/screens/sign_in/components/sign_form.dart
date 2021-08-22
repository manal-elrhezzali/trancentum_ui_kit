import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/client.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';

import '../../forgot_password/forgot_password_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool visibility = false;
  final _formKey = GlobalKey<FormState>();
  Client user = new Client(email: "", password: "", id: "c4");

  bool rememberMeIsChecked = false;
  final _passwordFocusNode = FocusNode();
  var emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    // print(user.email);
    // print(user.password);
    Navigator.of(context).pushNamed(HomeScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Logged In",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              onSaved: (newValue) => user.email = newValue,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please provide an Email";
                }
                var result = new RegExp(emailPattern, caseSensitive: false)
                    .hasMatch(value);
                if (!result) {
                  return "Please provide a valid email";
                }
                return null; //means there is no error
              },
              decoration: InputDecoration(
                hintText: "Enter your Email",
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              onSaved: (newValue) => user.password = newValue,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please provide a password";
                }
                return null;
              },
              focusNode: _passwordFocusNode,
              obscureText: visibility == false ? true : false,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(20),
                    getProportionateScreenWidth(20),
                    getProportionateScreenWidth(20),
                  ),
                  child: IconButton(
                    icon: visibility == false
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: rememberMeIsChecked,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      rememberMeIsChecked = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            // FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              pressHandler: () {
                _saveForm();
              },
            ),
          ],
        ),
      ),
    );
  }
}
