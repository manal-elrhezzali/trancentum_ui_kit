import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trancentum_ui_kit/data/expeditions.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';

import '../../../constants.dart';

class InfoGeneraleDatatable extends StatelessWidget {
  final columns = [
    "Déclaration",
    "Date creation",
    "Etat",
    "Livraison",
    "Ville Départ",
  ];

  final String expeditionCode = "";

  final List<Expedition> expeditionList = [];

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: TextStyle(color: kPrimaryColor),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Expedition> expeditions) =>
      expeditions.map((Expedition expedition) {
        final cells = [
          expedition.codeExpedition,
          DateFormat.yMMMd().format(expedition.dcreation),
          expedition.etat.toString().split('.').last,
          expedition.typeLivraison,
          expedition.villeExpediteurId,
        ];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<Object> cells) => cells
      .map(
        (data) => DataCell(
          Text(
            '$data',
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final expeditionCode = ModalRoute.of(context).settings.arguments as String;
    print(expeditionCode);

    Expedition expedition = demoExpeditions
        .firstWhere((element) => element.codeExpedition == expeditionCode);
    expeditionList.add(expedition);
    return DataTable(
      columnSpacing: defaultPadding,
      horizontalMargin: 0,
      columns: getColumns(columns),
      rows: getRows(expeditionList),
    );
  }
}
