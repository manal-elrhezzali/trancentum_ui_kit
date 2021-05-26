import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/controllers/menu_controller.dart';

import '../../responsive.dart';
import '../dashboard/dashboard.dart';
import './components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, //by default flex =1
                child: SideMenu(),
              ),
            Expanded(
              flex: 5, //takes 5/6 of the screen
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
