import 'package:flutter/material.dart';

import 'package:trancentum_ui_kit/constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "Aide",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              Text(
                "Contactez-nous",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
             buildContactItem(
                context,
                () {},
                Icons.location_on,
                "Meet Us",
                "Twin Center, Angle Bd Zerktouni et Al Massira5ème étages 20100",
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildContactItem(
                context,
                () {},
                Icons.phone,
                "Call Us",
                "+212 707-090303",
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildContactItem(
                context,
                () {},
                Icons.location_on,
                "Email Us",
                "contact@trancentum.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
  Padding buildContactItem(BuildContext context, Function press, IconData icon,
      String contactTypetext, String contactTypeInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactTypetext,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    contactTypeInfo,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
