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
      children: [
        Row(
          children: [
            Text("Phone Number"),
            Text("0676175459"),
          ],
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Text("Phone Number"),
            Text("0676175459"),
          ],
        ),
      ],
    );
  }
}
