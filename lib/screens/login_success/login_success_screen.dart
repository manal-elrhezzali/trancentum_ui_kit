import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_back_button.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Success"),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
      ),
      body: Body(),
    );
  }
}
