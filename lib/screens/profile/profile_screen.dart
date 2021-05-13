import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trancentum_ui_kit/components/custom_bottom_navigation_bar.dart';
import 'package:trancentum_ui_kit/constants.dart';
import 'package:trancentum_ui_kit/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedMenuItem: MenuState.profile,
      ),
    );
  }
}

