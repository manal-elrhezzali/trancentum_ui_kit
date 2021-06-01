import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';
import './components/body.dart';


class NewExpeditionScreen extends StatelessWidget {
  static String routeName = "/new_expedition";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle Expedition"),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}