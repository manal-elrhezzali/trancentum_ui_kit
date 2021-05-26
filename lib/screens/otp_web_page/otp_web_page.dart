import 'package:flutter/material.dart';
import 'components/body.dart';


class OtpWebPage extends StatelessWidget {
  static String routeName = "/otp-web";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _widthValue = _size.width >= 1100.0 ? 0.35 : 0.1;
    double _sizeBetween = _size.width >= 1100.0 ? 50.0 : 20.0;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/main_bg.jpg",
            fit: BoxFit.cover,
          ),
          SizedBox(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: _size.width * _widthValue),
              decoration: BoxDecoration(
                color: Color(0xFFF7F6F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: _sizeBetween),
                  Body(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

