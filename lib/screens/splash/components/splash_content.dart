import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: Text(
            "TranCENTUM",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 2),
        Expanded(
          flex: 6,
          child: Image.asset(
            image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
          ),
        ),
      ],
    );
  }
}
