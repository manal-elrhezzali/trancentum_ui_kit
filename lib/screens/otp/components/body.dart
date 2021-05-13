import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
            ),
          ),
          Text("We sent your code to +212 676 175 ***"),
          buildTimer(),
        ],
      ),
    );
  }

  Row buildTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expire in "),
            TweenAnimationBuilder(
              tween: Tween(
                begin: 30.0,
                end: 0,
              ),
              duration: Duration(
                seconds: 30,
              ),
              builder: (context, value, child) => Text(
                "00:${value.toInt()}",
                style: TextStyle(color: Colors.red),
              ),
              //what to do when the timer ends
              onEnd: () {},
            ),
          ],
        );
  }
}
