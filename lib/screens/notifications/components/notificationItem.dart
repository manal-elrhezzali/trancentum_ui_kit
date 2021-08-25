import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/providers/notifications.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/expedition_detail_screen.dart';

import '../../../constants.dart';

class NotificationItem extends StatelessWidget {
  final String expeditionId;
  final String notificationId;
  const NotificationItem({
    Key key,
    @required this.notificationId,
    @required this.expeditionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(notificationId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Do you want to delete the notification?',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Notifications>(context, listen: false)
            .removeItem(notificationId);
      },
      child: Card(
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
          subtitle: Text( "Cette expédition $expeditionId"),
          onTap: () {
            Navigator.of(context).pushNamed(ExpeditionDetailScreen.routeName,
                arguments: expeditionId);
            //TO DO : remove this clicked item from notifications list
          },
        ),
      ),
    );
  }
}
