import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/sign_in/sign_in_screen.dart';

class ErrorScreen extends StatelessWidget {
  static String routeName = "/something_went_wrong";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/error_image.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInScreen.routeName);
                },
                child: Text(
                  "Retry".toUpperCase(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
