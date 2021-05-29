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
              // SideMenuItem(
              //   text: "Meet Us",
              //   icon: "",
              //   press: () {},
              // ),
              Padding(
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
                  onPressed: () {
                    //launch maps with trancentum address
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Meet Us",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Padding(
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
                  onPressed: () {
                    //launch Appel with trancentum tel
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Call Us",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Padding(
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
                  onPressed: () {
                    //launch Email app with trancentum email
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Email Us",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
