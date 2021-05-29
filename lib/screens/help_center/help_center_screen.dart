import 'package:flutter/material.dart';

import './components/body.dart';
import '../../components/side_menu.dart';

class HelpCenterScreen extends StatelessWidget {
 static String routeName = "/help-center";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aide"),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
