import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/new_expedition/new_expedition_screen.dart';
import '../screens/profile/components/profile_image.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/help_center/help_center_screen.dart';
import '../screens/profile/profile_screen.dart.dart';
import './side_menu_item.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: ProfileImage(),
            ),
            SideMenuItem(
              icon: "assets/icons/Menu Dashboard.svg",
              text: "Dashboard",
              press: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/User Icon.svg",
              text: "Compte",
              press: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Menu Notification.svg", 
              text: "Notifications",
              press: () {},
            ),
            SideMenuItem(
              icon: "assets/icons/Package.svg",
              text: "Nouvelle Expédition",
              press: () {
                Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Question Mark.svg",
              text: "Aide",
              press: () {
                Navigator.of(context).pushNamed(HelpCenterScreen.routeName);

              },
            ),
            SideMenuItem(
              icon: "assets/icons/Log out.svg",
              text: "Déconnexion",
              press: () {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

