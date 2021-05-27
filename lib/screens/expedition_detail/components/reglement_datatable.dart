import 'package:flutter/material.dart';

// class RetourFondsDatatable extends StatelessWidget {
//   final columns = [
//     "Retour",
//     "Montant en DH",
//     "Nombre",
//     "Banque",
//     "Série",
//     "Observation",
//     "Etat",
//   ];

//   List<DataColumn> getColumns(List<String> columns) => columns
//       .map((String column) => DataColumn(
//             label: Text(
//               column,
//               style: TextStyle(color: Colors.white),
//             ),
//           ))
//       .toList();

//   List<DataRow> getRows(List<RetourFonds> retoursFonds) =>
//       retoursFonds.map((RetourFonds retour) {
//         final cells = [
//           retour.retourDeFonds,
//           retour.montant,
//           retour.nombre,
//           retour.banque,
//           retour.serie,
//           retour.observation,
//           retour.etat,

//         ];
//         return DataRow(cells: getCells(cells));
//       }).toList();
//   List<DataCell> getCells(List<String> cells) => cells
//       .map((data) => DataCell(Text(
//             '$data',
//             style: TextStyle(color: Colors.white),
//           )))
//       .toList();

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columnSpacing: defaultPadding,
//       horizontalMargin: 0,
//       columns: getColumns(columns),
//       rows: getRows(demoRetoursDeFonds),
//     );
//   }
// }