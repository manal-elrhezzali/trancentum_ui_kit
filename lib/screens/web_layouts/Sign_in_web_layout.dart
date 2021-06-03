import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInWebLayout extends StatelessWidget {
  static String routeName = "/sign_in_web";
  const SignInWebLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Body(),
    );
  }
}