import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_ui_kit/data/expeditions.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/expedition_detail_screen.dart';

import '../../../../constants.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);
  var searchFieldController = TextEditingController();
  String searchFieldValue = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      //add a controller
      controller: searchFieldController,
      decoration: InputDecoration(
        hintText: "Code d\'expédition",
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            //search for the codeExpedition in expeditions
            searchFieldValue = searchFieldController.text;
            if (searchFieldValue.isNotEmpty) {
              print(searchFieldValue);
              int expeditionFoundIndex = demoExpeditions.indexWhere(
                  (element) => element.codeExpedition == searchFieldValue);
              if (expeditionFoundIndex == -1) {
                //show a snackbar of expedition not found
              } else {
                //pass the object to the expedition details screen
                print(demoExpeditions[expeditionFoundIndex]
                    .etat
                    .toString()
                    .split('.')
                    .last);
                Navigator.of(context).pushNamed(
                    ExpeditionDetailScreen.routeName,
                    arguments: expeditionFoundIndex);
              }
            } else {
              //search field vaLUE IS EMPTY
              //show snackbar enter  a valid code expedition
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            padding: EdgeInsets.all(defaultPadding * 0.75),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
