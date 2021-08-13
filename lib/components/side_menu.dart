import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/constants.dart';
import 'package:trancentum_ui_kit/screens/notifications/notifications_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/new_expedition/new_expedition_screen.dart';
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
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: Image.asset("assets/images/trancentum_logo.png"),
              ),
            ),
            SideMenuItem(
              icon: "assets/icons/Menu Dashboard.svg",
              text: "Dashboard",
              press: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/User Icon.svg",
              text: "Compte",
              press: () {
                Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Menu Notification.svg",
              text: "Notifications",
              press: () {
                Navigator.of(context).pushReplacementNamed(NotificationsScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Package.svg",
              text: "Nouvelle Expédition",
              press: () {
                Navigator.of(context).pushReplacementNamed(NewExpeditionScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Question Mark.svg",
              text: "Aide",
              press: () {
                Navigator.of(context).pushReplacementNamed(HelpCenterScreen.routeName);
              },
            ),
            SideMenuItem(
              icon: "assets/icons/Log out.svg",
              text: "Déconnexion",
              press: () {
                // Navigator.of(context).popUntil((route) => route.toString() == SignInScreen.routeName);
                Navigator.of(context).pushReplacementNamed(SignInScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
