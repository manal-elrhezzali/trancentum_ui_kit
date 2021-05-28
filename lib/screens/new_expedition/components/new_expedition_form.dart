import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/components/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class NewExpeditionForm extends StatefulWidget {
  @override
  _NewExpeditionFormState createState() => _NewExpeditionFormState();
}

class _NewExpeditionFormState extends State<NewExpeditionForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String dummyDetail1;
  String dummyDetail2;
  String dummyDetail3;

  Widget buildSubForm(String title, List<Widget> widgets) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          ...widgets,
        ],
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

    String valueChose;
    List listItems = [
      "Meknes",
      "Casablanca",
      "Fès",
    ];
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5, //takes 5/6 of the screen
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      buildSubForm(
                        "Expéditeur / Destinataire",
                        [
                          buildTextFormField(outlineInputBorder,
                              "Enter le nom d\'expéditeur", "Nom Expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildTextFormField(outlineInputBorder,
                              "Enter le tel d\'expéditeur", "Tél Expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          //dropDownButton
                          buildDropDownButton(valueChose, listItems, "Ville Expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildTextFormField(outlineInputBorder,
                              "Enter le nom destinataire", "Nom Destinataire"),
                              SizedBox(height: getProportionateScreenHeight(20)),
                          buildTextFormField(outlineInputBorder,
                              "Enter le tel destinataire", "Tél Destinataire"),
                              SizedBox(height: getProportionateScreenHeight(20)),
                          //dropDownButton
                          buildDropDownButton(valueChose, listItems, "Ville Destinataire"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      //
                      buildSubForm(
                        "Retours de fonds",
                        [
                          buildTextFormField(outlineInputBorder,
                              "Enter le nom d\'expéditeur", "Nom expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildTextFormField(outlineInputBorder,
                              "Enter le tel d\'expéditeur", "Tél expéditeur"),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          //dropDownButton
                          buildDropDownButton(valueChose, listItems, "Ville Expéditeur"),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      DefaultButton(
                        text: "Confirmer",
                        pressHandler: () {
                          //if all inputs are valide go to OTP screen
                          // Navigator.of(context).pushNamed(OtpScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDropDownButton(
      String valueChose, List listItems, String hint) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kTextColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: DropdownButton(
        hint: Text(hint),
        dropdownColor: kPrimaryColor,
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        underline: SizedBox(),
        value: valueChose,
        onChanged: (newValue) {
          setState(() {
            valueChose = newValue;
          });
        },
        items: listItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(
              valueItem,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }

  TextFormField buildTextFormField(
      OutlineInputBorder outlineInputBorder, String hint, String label) {
    return TextFormField(
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
