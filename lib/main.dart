import 'package:flutter/material.dart';

import './routes.dart';
import './theme.dart';
// import './screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TranCENTUM',
      theme: theme(),
      // initialRoute: SplashScreen.routeName,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
