import 'package:flutter/material.dart';

import './size_config.dart';

const kPrimaryColor = Color(0xFF3A37C2);
const kPrimaryLightColor = Color(0xFF858BA6);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF6470A6), Color(0xFF4256A6)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

//Dashbord / HomeScreen
const primaryColor = Color(0xFF2697FF);
// const secondaryColor = Color(0xFF8CC8FF);
const secondaryColor = Color(0xFF73BCFF);

// const bgColor = Color(0xFF212332);
const bgColor = Color(0xFF2A2D3E);

const defaultPadding = 16.0;


// Form Error
//add ICE RegExp
const String kIceNullError = "Please Enter your ICE";
const String kInvalidIceError = "Please Enter Valid Ice";
const String kPasswordNullError = "Please Enter your password";
const String kPhoneNumberNullError = "Please Enter your phone number";
//add validation of complete profile

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenWidth(15),
  ),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: kTextColor),
);
}
