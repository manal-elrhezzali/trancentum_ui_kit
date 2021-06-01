import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_back_button.dart';

import './components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
      ),
      body: Body(),
    );
  }
}