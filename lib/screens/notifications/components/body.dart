import 'package:flutter/material.dart';

import 'notificationItem.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return NotificationItem(subtitle: "L'expédition 56412 est enregistrée");
      },
    ));
  }
}
