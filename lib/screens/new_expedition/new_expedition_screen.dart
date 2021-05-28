import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';
import './components/body.dart';


class NewExpeditionScreen extends StatelessWidget {
  static String routeName = "/new_expedition";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: SideMenu(),
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}