import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/otp/otp_screen.dart';

import '../../../components/default_button.dart';
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
                    "Please enter your Email and we will \n send you an OTP verification code ",
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
  String email = "";
  var emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void _sendOTP() async {
    EmailAuth.sessionName = "Test Session";
    var response = await EmailAuth.sendOtp(receiverMail: email);
    if (response) {
      print("OTP SENT SUCCESSFULLY");
    } else {
      print("we could not send the OTP code");
    }
  }
//after user enters OTP Code
  // void verifyOTP() {
  //   var result = EmailAuth.validate(receiverMail: email, userOTP: userOTP);
  //    if (result) {
  //     print("OTP Verified");
  //   } else {
  //     print("Invalid OTP");
  //   }
  // }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(email);
    _sendOTP();
    Navigator.of(context).pushNamed(OtpScreen.routeName, arguments: email);
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
      child: Column(
        children: [
          buildEmailFormField(outlineInputBorder),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            pressHandler: _saveForm,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          NoAccountText(),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField(OutlineInputBorder outlineInputBorder) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "Please provide an Email";
        }
        var result =
            new RegExp(emailPattern, caseSensitive: false).hasMatch(value);
        if (!result) {
          return "Please provide a valid email";
        }
        return null; //means there is no error
      },
      decoration: InputDecoration(
        hintText: "Enter your email",
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
    );
  }
}
