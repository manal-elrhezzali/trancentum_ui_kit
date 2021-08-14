import 'package:flutter/material.dart';
import '../../components/side_menu.dart';
import 'dashboard/dashboard.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: SideMenu(),
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (ResponsiveWidget.isDesktop(context))
            //   Expanded(
            //     // flex: 1, //by default flex =1
            //     child: SideMenu(),
            //   ),
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
