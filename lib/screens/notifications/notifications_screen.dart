import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';
import 'package:trancentum_ui_kit/providers/notifications.dart';

import 'components/body.dart';

class NotificationsScreen extends StatelessWidget {
  static String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    final notificationsData = Provider.of<Notifications>(context);
    List notifications = notificationsData.items;
    print(notifications[0].id);
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
