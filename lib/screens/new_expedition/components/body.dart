import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'new_expedition_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Nouvelle Expédition",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                Text(
                  "Déclarer une nouvelle expédition",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                NewExpeditionForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}