import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/screens/complete_profile/complete_profile_screen.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/expedition_detail_screen.dart';

import 'package:trancentum_ui_kit/screens/home/home_screen.dart';
import 'package:trancentum_ui_kit/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_ui_kit/screens/splash/splash_screen.dart';

import './routes.dart';
import './theme.dart';
import 'controllers/menu_controller.dart';


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
      // home:  MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],
      //   child: HomeScreen(),
      // ),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
