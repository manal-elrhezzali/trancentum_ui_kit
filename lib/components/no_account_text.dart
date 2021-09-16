import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  _openURL() async {
    if (await canLaunch("https://trancentum.com/")) {
      await launch("https://trancentum.com/");
    } else {
      print("could not launch");
    }
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
        GestureDetector(
          child: Text(
            "Contact us",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: kPrimaryColor,
            ),
          ),
          onTap: _openURL,
        ),
      ],
    );
  }
}
