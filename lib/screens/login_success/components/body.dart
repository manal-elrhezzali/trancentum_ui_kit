import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Image.asset(
              "assets/images/success.png",
              height: SizeConfig.screenHeight * 0.4,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              "Login Succcess",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "Go to home",
                pressHandler: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
