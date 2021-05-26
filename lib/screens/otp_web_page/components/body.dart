import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_textfield_web.dart';
import 'package:trancentum_ui_kit/components/custom_button_web.dart';

class Body extends StatelessWidget {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [    
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftSideBody(),
                  Expanded(
                    child: Column(
                      children: [
                        CustomTextFieldWeb(
                          nameController: phoneController,
                          label: "Tel",
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 28.0),
                        CustomButtonWeb(
                          text: "Continuer",
                          onPressed: () {
                            //check if inputs are valid then navigate user to OtpWebPage
                            //Navigator.of(context).pushNamed(OtpWebPage.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class LeftSideBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 500.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF404146),
                  ),
                ),
                Text(
                  "Please enter your phone number\nand we will send you an OTP\ncode by message",
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
