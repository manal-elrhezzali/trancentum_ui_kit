import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool visibility = false;
  final _formKey = GlobalKey<FormState>();
  String ice;
  String password;
  bool rememberMeIsChecked = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIceFormField(outlineInputBorder),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(outlineInputBorder),
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
              Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            pressHandler: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(OutlineInputBorder outlineInputBorder) {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kIceNullError)) {
          setState(() {
            errors.remove(kPasswordNullError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPasswordNullError)) {
          setState(() {
            errors.add(kPasswordNullError);
          });
        }
        return null;
      },
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
    );
  }

  TextFormField buildIceFormField(OutlineInputBorder outlineInputBorder) {
    return TextFormField(
      onSaved: (newValue) => ice = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kIceNullError)) {
          setState(() {
            errors.remove(kIceNullError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kIceNullError)) {
          setState(() {
            errors.add(kIceNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your ice",
        labelText: "Ice",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }

//   InputDecoration buildInputDecoration(String hintText, String labelText) {
//     var outlineInputBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(28),
//       borderSide: BorderSide(color: kTextColor),
//       gapPadding: 10,
//     );
//     return InputDecoration(
//       hintText: hintText,
//       labelText: labelText,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: 42,
//         vertical: 20,
//       ),
//       enabledBorder: outlineInputBorder,
//       focusedBorder: outlineInputBorder,
//       border: outlineInputBorder,
//     );
//   }
}