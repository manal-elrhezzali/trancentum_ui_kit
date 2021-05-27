import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';

import '../../../constants.dart';

class RecentExpeditionsArray extends StatelessWidget {
  const RecentExpeditionsArray({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Expéditions récentes",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: defaultPadding,
                horizontalMargin: 0,
                columns: [
                  DataColumn(
                    label: Text(
                      "Code d\' expédition",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "État",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "V. Départ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "V. D'arrivée",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: List.generate(
                  demoRecentExpeditions.length,
                  (index) => buildRecentExpeditionsDataRow(
                      demoRecentExpeditions[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow buildRecentExpeditionsDataRow(Expedition expedition) {
    return DataRow(
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              expedition.codeExpedition,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Text(
            expedition.date,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.etat,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.villeDepart,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.villeArrivee,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
