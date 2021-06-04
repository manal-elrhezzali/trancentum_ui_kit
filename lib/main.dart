import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trancentum_ui_kit/screens/sign_in/sign_in_screen.dart';
import 'package:trancentum_ui_kit/screens/sign_in_web/sign_in_web_page.dart';
import 'package:trancentum_ui_kit/screens/web_layouts/Sign_in_web_layout.dart';

import './screens/splash/splash_screen.dart';
import './routes.dart';
import './theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TranCENTUM',
      theme: theme(),
      // home:  MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],
      //   child: HomeScreen(),
      // ),
      home: SignInWebLayout(),
      routes: routes,
    );
  }
}
