import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/providers/notifications.dart';

import 'notificationItem.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationsData = Provider.of<Notifications>(context);
    List notifications = notificationsData.items;
    // print(notifications[0].id);
    //why is it null?

    return Center(
      child: ListView.builder(
        itemCount: notificationsData.itemCount,
        itemBuilder: (_, index) {
          // print(notifications[index].expeditionId);
          // print(notifications[index].id);
          return NotificationItem(
              notificationId: notifications[index].id,
              expeditionId: notifications[index].expeditionId);
        },
      ),
    );
  }
}
