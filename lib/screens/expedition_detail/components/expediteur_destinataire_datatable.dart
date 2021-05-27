import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';

import '../../../constants.dart';

class ExpediteurDestinataireDatatable extends StatelessWidget {
  final columns = [
    "Expediteur",
    "Destinataire",
    "Ville Expedieur",
    "Ville Destinataire",
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
          expedition.expediteur,
          expedition.destinataire,
          expedition.villeExpediteur,
          expedition.villeDestinataire,
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