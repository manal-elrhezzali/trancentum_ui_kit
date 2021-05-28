import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/infos_generales_datatable.dart';
import 'package:trancentum_ui_kit/controllers/menu_controller.dart';
import 'package:trancentum_ui_kit/components/side_menu.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'expediteur_destinataire_datatable.dart';
import 'reglement_datatable.dart';
import 'retour_fonds_datatable.dart';

class Body extends StatelessWidget {
  Widget buildDataTable(String title, Widget widget) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      backgroundColor: Color(0xFFF2F9FF),
      body: SafeArea(
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
                      SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                SizedBox(height: defaultPadding),
                                buildDataTable("Informations Générales",
                                    InfoGeneraleDatatable()),
                                SizedBox(height: defaultPadding),
                                buildDataTable("Expediteur / Destinataire",
                                    ExpediteurDestinataireDatatable()),
                                SizedBox(height: defaultPadding),
                                buildDataTable("Retours de fonds",
                                    RetourFondsDatatable()),
                                SizedBox(height: defaultPadding),
                                buildDataTable("Règlements",
                                    ReglementDatatable()),
                              ],
                            ),
                          ),
                        ],
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
}
