import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';

import '../../../constants.dart';

class InfoGeneraleDatatable extends StatelessWidget {
  final columns = [
    "Déclaration",
    "Date",
    "Etat",
    "Livraison",
    "Agence Départ",
  ];

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: TextStyle(color: Colors.white),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Expedition> expeditions) =>
      expeditions.map((Expedition expedition) {
        final cells = [
          expedition.codeExpedition,
          expedition.date,
          expedition.etat,
          expedition.livraison,
          expedition.agenceDepart
        ];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<String> cells) => cells
      .map((data) => DataCell(Text(
            '$data',
            style: TextStyle(color: Colors.white),
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: defaultPadding,
      horizontalMargin: 0,
      columns: getColumns(columns),
      rows: getRows(demoRecentExpeditions),
    );
  }
}
