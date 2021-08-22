import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trancentum_ui_kit/screens/forgot_password/forgot_password_screen.dart';
import 'package:trancentum_ui_kit/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_ui_kit/screens/profile/profile_screen.dart.dart';
import 'package:trancentum_ui_kit/screens/sign_in/sign_in_screen.dart';
import 'package:trancentum_ui_kit/screens/splash/splash_screen.dart';
import 'package:trancentum_ui_kit/screens/unknown_route/unknown_route_screen.dart';

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
      home: SplashScreen(),
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => UnknownRouteScreen());
      },
    );
  }
}
