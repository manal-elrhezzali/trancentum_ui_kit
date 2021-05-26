import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/otp_web_page/otp_web_page.dart';
// import 'package:trancentum_ui_kit/screens/sign_in_web/sign_in_web_page.dart';

import './routes.dart';
import './theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TranCENTUM',
      theme: theme(),
      home: OtpWebPage(),
      routes: routes,
    );
  }
}
