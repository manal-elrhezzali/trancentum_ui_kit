import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _form = GlobalKey<FormState>();
  var _initValues = {
    "adresse": "laurbbjkbfejbfkejkfbrekjk",
    "tel": "0676563549",
    "fixe": "0535615382",
    "fax": "gggg",
    "mdp": "123456789",
  };
  bool editButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10,
    );
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Compte"),
        actions: [
          IconButton(
            icon: Icon(
              editButtonClicked ? Icons.save : Icons.edit,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(() {
                editButtonClicked = !editButtonClicked;
              });
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                ProfileImage(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      buildTextFormField(
                          editButtonClicked,
                          _initValues["adresse"],
                          outlineInputBorder,
                          "",
                          "Addresse"),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildTextFormField(editButtonClicked, _initValues["tel"],
                          outlineInputBorder, "", "Tel"),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildTextFormField(editButtonClicked, _initValues["fixe"],
                          outlineInputBorder, "", "Fixe"),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildTextFormField(editButtonClicked, _initValues["fax"],
                          outlineInputBorder, "", "Fax"),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildTextFormField(editButtonClicked, _initValues["mdp"],
                          outlineInputBorder, "", "Mot De Passe"),
                      SizedBox(height: getProportionateScreenHeight(30)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(bool editButtonClicked, String initialVal,
      OutlineInputBorder outlineInputBorder, String hint, String label) {
    return TextFormField(
      readOnly: editButtonClicked ? false : true,
      initialValue: initialVal,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }
}
