import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_ui_kit/screens/otp/otp_screen.dart';

import '../screens/profile/profile_screen.dart';
import '../constants.dart';
import '../enums.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key key,
    @required this.selectedMenuItem,
  }) : super(key: key);

  final MenuState selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    final Color activeIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                //navigate to home screen
                //for test purposes
                // Navigator.of(context).pushNamed(OtpScreen.routeName);
              },
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenuItem
                    ? kPrimaryColor
                    : activeIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                //navigate to new shipping screen
              },
              icon: SvgPicture.asset(
                "assets/icons/Parcel.svg",
                color: MenuState.shipPackage == selectedMenuItem
                    ? kPrimaryColor
                    : activeIconColor,
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ProfileScreen.routeName),
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenuItem
                    ? kPrimaryColor
                    : activeIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
