import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_back_button.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
      ),
      body: Body(),
    );
  }
}


