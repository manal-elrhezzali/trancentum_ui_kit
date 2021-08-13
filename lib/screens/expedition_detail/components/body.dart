import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/infos_generales_datatable.dart';

import '../../../constants.dart';
import 'expediteur_destinataire_datatable.dart';
import 'reglement_datatable.dart';
import 'retour_fonds_datatable.dart';

class Body extends StatelessWidget {
  Widget buildDataTable(String title, Widget widget) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
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
    final expeditionIndex = ModalRoute.of(context).settings.arguments as int;
    print(expeditionIndex);
    return SafeArea(
      child: Center(
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
                      // SizedBox(height: defaultPadding),
                      SizedBox(height: defaultPadding),
                      buildDataTable(
                          "Informations Générales", InfoGeneraleDatatable(expeditionIndex)),
                      SizedBox(height: defaultPadding),
                      buildDataTable("Expediteur / Destinataire",
                          ExpediteurDestinataireDatatable()),
                      SizedBox(height: defaultPadding),
                      buildDataTable(
                          "Retours de fonds", RetourFondsDatatable()),
                      SizedBox(height: defaultPadding),
                      buildDataTable("Règlements", ReglementDatatable()),
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
