import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/providers/banques.dart';
import 'package:trancentum_ui_kit/providers/retours_de_fonds.dart';
import 'package:trancentum_ui_kit/providers/villes.dart';

import 'package:trancentum_ui_kit/screens/splash/splash_screen.dart';
import 'package:trancentum_ui_kit/screens/unknown_route/unknown_route_screen.dart';

import './routes.dart';
import './theme.dart';
import 'providers/expeditions.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Expeditions(),
          ),
        ChangeNotifierProvider.value(
          value: Villes(),
          ),
          ChangeNotifierProvider.value(
          value: RetoursDeFonds(),
          ),
          ChangeNotifierProvider.value(
          value: Banques(),
          ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TranCENTUM',
        theme: theme(),
        home: SplashScreen(),
        routes: routes,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => UnknownRouteScreen());
        },
      ),
    );
  }
}
