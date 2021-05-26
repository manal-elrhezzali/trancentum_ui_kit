import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_button_web.dart';
import 'package:trancentum_ui_kit/components/custom_textfield_web.dart';

class Body extends StatelessWidget {
  final otpCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftSideBody(),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 18.0),
                        buildTimer(),
                        CustomTextFieldWeb(
                          nameController: otpCodeController,
                          label: "OTP CODE",
                          icon: Icons.code,
                        ),
                        SizedBox(height: 18.0),
                        GestureDetector(
                          onTap: () {
                            //resend the 4 digit OTP code
                          },
                          child: Text(
                            "Resend OTP Code",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(height: 18.0),
                        CustomButtonWeb(
                          text: "Continuer",
                          onPressed: () {
                            //check if inputs are valid then navigate user to OtpWebPage
                            //Navigator.of(context).pushNamed(OtpWebPage.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
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

class LeftSideBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 500.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF404146),
                  ),
                ),
                Text(
                  "We sent your code to\n+212 676 175 ***",
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
