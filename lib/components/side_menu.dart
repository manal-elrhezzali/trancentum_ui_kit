import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';
import 'package:trancentum_ui_kit/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_ui_kit/screens/profile/profile_screen.dart';
import 'package:trancentum_ui_kit/screens/sign_in/sign_in_screen.dart';

import '../constants.dart';

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
              child: Image.asset("assets/images/trancentum_logo.png"),
            ),
            DrawerListTile(
              title: 'Accueil',
              svgSrc: "assets/icons/Menu Dashboard.svg",
              press: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
            DrawerListTile(
              title: 'Profile',
              svgSrc: "assets/icons/User Icon.svg",
              press: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
            ),
            DrawerListTile(
              title: 'Notifications',
              svgSrc: "assets/icons/Menu Notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Nouvelle Expédition',
              svgSrc: "assets/icons/Package.svg",
              press: () {
                Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
              },
            ),
            DrawerListTile(
              title: 'Help Center',
              svgSrc: "assets/icons/Question Mark.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Logout',
              svgSrc: "assets/icons/Log out.svg",
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

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final ui.VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: kPrimaryLightColor,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            // color: Colors.white54,
            ),
      ),
    );
  }
}
