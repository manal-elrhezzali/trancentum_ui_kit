import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/otp/otp_screen.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Please enter your phone number and we will \n send you your password by message ",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  ForgotPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String phoneNumber;

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
          buildPhoneNumberFormField(outlineInputBorder),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            pressHandler: () {
              if (_formKey.currentState.validate()) {
                Navigator.of(context).pushNamed(OtpScreen.routeName);
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          NoAccountText(),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(
      OutlineInputBorder outlineInputBorder) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
        //   setState(() {
        //     errors.remove(kPhoneNumberNullError);
        //   });
        // }
      },
      validator: (value) {
        // if (value.isEmpty && !errors.contains(kPhoneNumberNullError)) {
        //   setState(() {
        //     errors.add(kPhoneNumberNullError);
        //   });
        // }
        // return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your phone number",
        labelText: "Phone Number",
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
}
