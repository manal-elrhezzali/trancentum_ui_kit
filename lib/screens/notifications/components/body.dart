import 'package:flutter/material.dart';

import 'notificationItem.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return NotificationItem(subtitle: "L'expédition 56412 est enregistrée");
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}


