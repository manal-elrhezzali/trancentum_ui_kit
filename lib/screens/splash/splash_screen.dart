import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/responsive_widget.dart';
import 'package:trancentum_ui_kit/screens/sign_in/sign_in_screen.dart';
import 'package:trancentum_ui_kit/screens/web_layouts/sign_in_layout/sign_in_web_layout.dart';

import './components/body.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (ResponsiveWidget.isMobile(context)) {
      if (Platform.isIOS || Platform.isAndroid) {
        return Scaffold(
          body: Body(),
        );
      } else {
        return SignInWebLayout();
      }
    } else {
      if (Platform.isIOS || Platform.isAndroid) {
        return SignInScreen();
      } else {
        return SignInWebLayout();
      }
    }
  }
}
