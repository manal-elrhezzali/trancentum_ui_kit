import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/expedition_detail_screen.dart';

import '../../../constants.dart';

class NotificationItem extends StatelessWidget {
  final String subtitle;
  const NotificationItem({
    Key key,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: kPrimaryColor,
      child: ListTile(
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
        onTap: () {
          Navigator.of(context).pushNamed(ExpeditionDetailScreen.routeName);
          //TO DO : remove this clicked item from notifications list
        },
      ),
    );
  }
}