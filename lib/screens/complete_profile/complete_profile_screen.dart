import 'package:flutter/material.dart';

import 'components/body.dart';
 

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
      ),
      body: Body(),
    );
  }
}