import 'package:flutter/material.dart';

import './size_config.dart';

const kPrimaryColor = Color(0xFF3A37C2);
const kPrimaryLightColor = Color(0xFF858BA6);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF6470A6), 
  Color(0xFF4256A6)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
//add ICE RegExp
const String kIceNullError = "Please Enter your ICE";
const String kInvalidIceError = "Please Enter Valid Ice";
const String kPasswordNullError = "Please Enter your password";
const String kPhoneNumberNullError = "Please Enter your phone number";

