import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_back_button.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';

import 'components/body.dart';

class NotificationsScreen extends StatelessWidget {
  static String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        // automaticallyImplyLeading: false,
        // leading: CustomBackButton(),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
