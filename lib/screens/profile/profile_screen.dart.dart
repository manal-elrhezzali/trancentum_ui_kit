import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';
import 'package:trancentum_ui_kit/screens/home/home_screen.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _focusTelField = FocusNode();
  FocusNode _focusFixeField = FocusNode();
  FocusNode _focusFaxField = FocusNode();

  String adresse = "";
  String tel = "";
  String fixe = "";
  String fax = "";
  //review this
  var telPattern = r'ˆ(+212|0)([0-9]){9}$';

  var _initValues = {
    "adresse": "laurbbjkbfejbfkejkfbrekjk",
    "tel": "0676563549",
    "fixe": "0535615382",
    "fax": "0535615584",
  };
  bool editButtonClicked = false;

  @override
  void dispose() {
    _focusTelField.dispose();
    _focusFixeField.dispose();
    _focusFaxField.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    // print(adresse);
    // print(tel);
    // print(fixe);
    // print(fax);
    Navigator.of(context).pushNamed(HomeScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Profile modifié",
        ),
      ),
    );
  }

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
                if (editButtonClicked) {
                  _saveForm();
                }
                editButtonClicked = !editButtonClicked;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
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
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            readOnly: editButtonClicked ? false : true,
                            onSaved: (newValue) => adresse = newValue,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_focusTelField);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please provide an address";
                              }

                              return null; //means there is no error
                            },
                            initialValue: _initValues["adresse"],
                            decoration: InputDecoration(
                              hintText: "",
                              labelText: "Addresse",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(
                          //     editButtonClicked,
                          //     _initValues["adresse"],
                          //     outlineInputBorder,
                          //     "",
                          //     "Addresse"),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          TextFormField(
                            focusNode: _focusTelField,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please provide a Tel";
                              }
                              // var result =
                              //     new RegExp(telPattern, caseSensitive: false)
                              //         .hasMatch(value);
                              // if (!result) {
                              //   return "Veuillez saisir un tel valid";
                              // }

                              return null; //means there is no error
                            },
                            onSaved: (newValue) => tel = newValue,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_focusFixeField);
                            },
                            readOnly: editButtonClicked ? false : true,
                            initialValue: _initValues["tel"],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "",
                              labelText: "Tel",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(editButtonClicked, _initValues["tel"],
                          //     outlineInputBorder, "", "Tel"),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          TextFormField(
                            focusNode: _focusFixeField,
                            onSaved: (newValue) => fixe = newValue,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please provide a Fixe";
                              }

                              return null; //means there is no error
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_focusFaxField);
                            },
                            readOnly: editButtonClicked ? false : true,
                            initialValue: _initValues["fixe"],
                            decoration: InputDecoration(
                              hintText: "",
                              labelText: "Fixe",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(editButtonClicked, _initValues["fixe"],
                          //     outlineInputBorder, "", "Fixe"),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          TextFormField(
                            focusNode: _focusFaxField,
                            keyboardType: TextInputType.phone,
                            onSaved: (newValue) => fax = newValue,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please provide a Fax";
                              }

                              return null; //means there is no error
                            },
                            readOnly: editButtonClicked ? false : true,
                            initialValue: _initValues["fax"],
                            decoration: InputDecoration(
                              hintText: "",
                              labelText: "Fax",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 20,
                              ),
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                            ),
                          ),
                          // buildTextFormField(editButtonClicked, _initValues["fax"],
                          //     outlineInputBorder, "", "Fax"),
                          SizedBox(height: getProportionateScreenHeight(30)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TextFormField buildTextFormField(bool editButtonClicked, String initialVal,
  //     OutlineInputBorder outlineInputBorder, String hint, String label) {
  //   return TextFormField(
  //     readOnly: editButtonClicked ? false : true,
  //     initialValue: initialVal,
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       labelText: label,
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       contentPadding: EdgeInsets.symmetric(
  //         horizontal: 42,
  //         vertical: 20,
  //       ),
  //       enabledBorder: outlineInputBorder,
  //       focusedBorder: outlineInputBorder,
  //       border: outlineInputBorder,
  //     ),
  //   );
  // }
}
