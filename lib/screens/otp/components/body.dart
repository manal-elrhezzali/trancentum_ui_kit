import 'package:flutter/material.dart';

import '../../../size_config.dart';
import './otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
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
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  OtpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  InkWell(
                    onTap: () {
                      //resend the OTP code
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
