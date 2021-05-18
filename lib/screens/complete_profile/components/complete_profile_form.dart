import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/otp/otp_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String dummyDetail1;
  String dummyDetail2;
  String dummyDetail3;

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
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your dummy data1",
              labelText: "Dummy1",
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
            decoration: InputDecoration(
              hintText: "Enter your dummy data2",
              labelText: "Dummy2",
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
            decoration: InputDecoration(
              hintText: "Enter your dummy data3",
              labelText: "Dummy3",
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
            decoration: InputDecoration(
              hintText: "Enter your dummy data3",
              labelText: "Dummy3",
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
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            pressHandler: () {
              //if all inputs are valide go to OTP screen
              // Navigator.of(context).pushNamed(OtpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
