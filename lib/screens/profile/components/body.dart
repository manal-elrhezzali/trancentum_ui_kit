import 'package:flutter/material.dart';

import '../../sign_in/sign_in_screen.dart';
import '../../../components/side_menu_item.dart';
import './profile_image.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileImage(),
          SizedBox(height: 20),
          SideMenuItem(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            press: () {},
          ),
          SideMenuItem(
            icon: "assets/icons/Bell.svg",
            text: "Notifications",
            press: () {},
          ),
          SideMenuItem(
            icon: "assets/icons/Question Mark.svg",
            text: "Help Center",
            press: () {},
          ),
          SideMenuItem(
            icon: "assets/icons/Log out.svg",
            text: "Log Out",
            press: () {
              Navigator.of(context).pushNamed(SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
