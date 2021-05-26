import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/custom_textfield_web.dart';
import 'package:trancentum_ui_kit/components/custom_web_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _passwordVisible;

  var cneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Image.asset("assets/images/trancentum_logo.png"),
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
                          nameController: cneController,
                          label: "CNE",
                          icon: Icons.person,
                        ),
                        SizedBox(height: 18.0),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: TextField(
                            obscureText: !_passwordVisible,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFF3D45EE),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              labelText: "PASSWORD",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    BorderSide(width: 0.2, color: Colors.grey),
                              ),
                              labelStyle: TextStyle(fontSize: 14.0),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        CustomButtonWeb(
                          text: "Continuer",
                          onPressed: () {
                            //check if inputs are valid then navigate user to homeScreen
                            //Navigator.of(context).pushNamed(HomeScreen.routeName);
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
                  "Bienvenue",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF404146),
                  ),
                ),
                Text(
                  "Automatisez et\nsimplifier vos\nprocessus de gestion\nlogistique et\ntransport.",
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 30.0,
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
