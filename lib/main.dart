import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/controllers/menu_controller.dart';

import './routes.dart';
import './theme.dart';
import './screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';

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
      initialRoute: SplashScreen.routeName,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: HomeScreen(),
      ),
      routes: routes,
    );
  }
}
