import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              title: 'Dashboard',
              svgSrc: "assets/icons/Menu Dashboard.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Profile',
              svgSrc: "assets/icons/User Icon.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Notifications',
              svgSrc: "assets/icons/Menu Notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'New Shipping',
              svgSrc: "assets/icons/Package.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Help Center',
              svgSrc: "assets/icons/Question Mark.svg",
              press: () {},
            ),
            DrawerListTile(
              title: 'Logout',
              svgSrc: "assets/icons/Log out.svg",
              press: () {},
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
