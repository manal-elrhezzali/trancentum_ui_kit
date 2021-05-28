import 'package:flutter/material.dart';

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
          buildTextFormField(
              outlineInputBorder, "Enter your dummy data1", "Dummy1"),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTextFormField(
              outlineInputBorder, "Enter your dummy data2", "Dummy2"),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTextFormField(
              outlineInputBorder, "Enter your dummy data3", "Dummy3"),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTextFormField(
              outlineInputBorder, "Enter your dummy data4", "Dummy4"),
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

  TextFormField buildTextFormField(
      OutlineInputBorder outlineInputBorder, String hint, String label) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
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
