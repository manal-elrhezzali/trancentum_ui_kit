import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotificationItem extends StatelessWidget {
  final String subtitle;
  const NotificationItem({
    Key key,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/trancentum_logo.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      title: Text(
        "Le status de votre Expédition a changé",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}