import 'package:flutter/material.dart';


class UnknownRouteScreen extends StatelessWidget {
  static String routeName = "/page_not_found";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/8_404 Error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.17),
                  ),
                ],
              ),
              child: FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  //if signed in go 5to dashboard
                  //if not signed in go to splashscreen
                },
                child: Text("Home".toUpperCase()),
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}