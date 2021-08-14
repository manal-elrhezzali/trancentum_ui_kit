import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return ContactInfoBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
          ),
        ),
        //wrap this with a gesture detector to dial
        //tranCENTUM phone number if storactive agrees
        GestureDetector(
          child: Text(
            "Contact us",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: kPrimaryColor,
            ),
          ),
          onTap: () => _showBottomSheet(context),
        ),
      ],
    );
  }
}

class ContactInfoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: new Icon(
            Icons.phone_android_outlined,
            color: kPrimaryColor,
          ),
          title: new Text('Tel'),
          subtitle: Text("+212676175413"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: new Icon(
            Icons.place_outlined,
            color: kPrimaryColor,
          ),
          title: new Text('Adresse'),
          subtitle: Text(
              "Hauptstraße 5: 01234 Musterstadt. Australie"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: new Icon(
            Icons.email_outlined,
            color: kPrimaryColor,
          ),
          title: new Text('E-mail'),
          subtitle: Text("qqqqwww@gmail.com"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
