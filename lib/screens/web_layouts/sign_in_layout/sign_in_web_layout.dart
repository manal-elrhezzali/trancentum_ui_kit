import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/constants.dart';

import 'components/body.dart';

class SignInWebLayout extends StatelessWidget {
  static String routeName = "/sign_in_web_layout";
  const SignInWebLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: Center(
        child: Body(),
      ),
    );
  }
}