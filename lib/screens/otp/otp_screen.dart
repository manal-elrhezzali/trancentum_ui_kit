import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_bottom_navigation_bar.dart';
import 'package:trancentum_ui_kit/enums.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   selectedMenuItem: MenuState.home,
      // ),
    );
  }
}
