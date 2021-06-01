import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_back_button.dart';

import './components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
      ),
      body: Body(),
    );
  }
}
