import 'package:flutter/material.dart';

import '../../sign_in/sign_in_screen.dart';
import './profile_menu.dart';
import './profile_image.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileImage(),
          SizedBox(height: 20),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Bell.svg",
            text: "Notifications",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Question Mark.svg",
            text: "Help Center",
            press: () {},
          ),
          ProfileMenu(
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
