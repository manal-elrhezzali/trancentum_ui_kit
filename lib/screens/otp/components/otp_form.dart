import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'package:trancentum_ui_kit/screens/error/error_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusOnDigit2 = FocusNode();
  FocusNode focusOnDigit3 = FocusNode();
  FocusNode focusOnDigit4 = FocusNode();
  FocusNode focusOnDigit5 = FocusNode();
  FocusNode focusOnDigit6 = FocusNode();

  String digit1 = "";
  String digit2 = "";
  String digit3 = "";
  String digit4 = "";
  String digit5 = "";
  String digit6 = "";

  @override
  void dispose() {
    focusOnDigit2.dispose();
    focusOnDigit3.dispose();
    focusOnDigit4.dispose();
    focusOnDigit5.dispose();
    focusOnDigit6.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void _verifyOTP(String email, String userOTP) async {
    var result = EmailAuth.validate(receiverMail: email, userOTP: userOTP);
    if (result) {
      print("OTP Verified");
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "OTP Verified",
          ),
        ),
      );
      _sendPasswordToUser(email);
    } else {
      print("Invalid OTP");
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Invalid OTP",
          ),
        ),
      );
    }
  }

  void _sendPasswordToUser(String email) async {
    String username = 'testtestrzzl@gmail.com';
    String password = 'poiuytrewq97531@';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(email)
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Your TranCENTUM account Password :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Your Password</h1>\n<p>Here add the password test test test</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Message sent",
          ),
        ),
      );
    } on MailerException catch (e) {
      print('Message not sent.');
                      Navigator.of(context).pushReplacementNamed(ErrorScreen.routeName);

      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void _saveForm(String email, String userOTP) {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(digit1);
    print(digit2);
    print(digit3);
    print(digit4);
    print(digit5);
    print(digit6);
    //verifies OTP
    _verifyOTP(email, userOTP);
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context).settings.arguments as String;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  onSaved: (newValue) => digit1 = newValue,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusOnDigit2);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: focusOnDigit2,
                  onSaved: (newValue) => digit2 = newValue,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusOnDigit3);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                  onSaved: (newValue) => digit3 = newValue,
                  focusNode: focusOnDigit3,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusOnDigit4);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusOnDigit5);
                  },
                  onSaved: (newValue) => digit4 = newValue,
                  focusNode: focusOnDigit4,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                  onSaved: (newValue) => digit5 = newValue,
                  focusNode: focusOnDigit5,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusOnDigit6);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Empty";
                    }
                    return null; //means there is no error
                  },
                  onSaved: (newValue) => digit6 = newValue,
                  focusNode: focusOnDigit6,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    focusOnDigit6.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            pressHandler: () {
              String codeOTP =
                  digit1 + digit2 + digit3 + digit4 + digit5 + digit6;
              _saveForm(email, codeOTP);
            },
          ),
        ],
      ),
    );
  }
}
