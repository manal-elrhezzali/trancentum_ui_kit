import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';
import 'package:trancentum_ui_kit/controllers/menu_controller.dart';
import 'package:trancentum_ui_kit/responsive_widget.dart';

import 'components/body.dart';

class ExpeditionsByStatusScreen extends StatelessWidget {
  const ExpeditionsByStatusScreen({Key key}) : super(key: key);

  static String routeName = "/expeditions-by-status";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expedition par status"),
      ),
      drawer: SideMenu(),
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
