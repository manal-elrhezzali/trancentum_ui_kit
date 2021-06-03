import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../../size_config.dart';
import '../../../components/default_button.dart';
import './splash_content.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashInfo = [
    {
      "text": "Bienvenue sur TranCENTUM",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashInfo.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashInfo[index]["text"],
                    image: splashInfo[index]["image"],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            splashInfo.length,
                            (index) => buildDot(index: index),
                          ),
                        ],
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: "Continuer",
                        pressHandler: () {
                          Navigator.of(context).pushNamed(SignInScreen.routeName);
                          // Navigator.of(context).pushNamed(CompleteProfileScreen.routeName);
                          // Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
                        },
                      ),
                      Spacer(),
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

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
      ),
    );
  }
}

