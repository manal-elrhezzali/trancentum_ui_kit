import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trancentum_ui_kit/providers/expeditions.dart';
import 'package:trancentum_ui_kit/providers/villes.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/infos_generales_datatable.dart';
import 'package:trancentum_ui_kit/screens/no_result_found/no_result_found_screen.dart';

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
    final _expeditionCode = ModalRoute.of(context).settings.arguments as String;
    print(_expeditionCode);
    final _searchedExpedition = Provider.of<Expeditions>(
      context,
      listen: false,
    ).findById(_expeditionCode);

    return SafeArea(
      child: _searchedExpedition == null
          ? NoResultFoundScreen()
          : Center(
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
                            buildDataTable(
                                "Informations G??n??rales",
                                InfoGeneraleDatatable(
                                  expeditionTrouvee: _searchedExpedition,
                                )),
                            SizedBox(height: defaultPadding),
                            buildDataTable("Expediteur / Destinataire",
                                ExpediteurDestinataireDatatable(expeditionTrouvee: _searchedExpedition,)),
                            SizedBox(height: defaultPadding),
                            buildDataTable(
                                "Retours de fonds", RetourFondsDatatable(expeditionTrouvee: _searchedExpedition)),
                            SizedBox(height: defaultPadding),
                            buildDataTable("R??glements", ReglementDatatable(expeditionTrouvee: _searchedExpedition)),
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
