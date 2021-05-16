import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import './components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              // flex: 1, //by default flex =1
              child: SideMenu(),
            ),
            Expanded(
              flex: 5, //takes 5/6 of the screen
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}


