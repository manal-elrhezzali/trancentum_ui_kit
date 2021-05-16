import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


import './chart.dart';
import './package_status_info_card.dart';
import '../../../constants.dart';

class AllPackagesStatus extends StatelessWidget {
  const AllPackagesStatus({
    Key key,
    @required this.pieChartSectionData,
  }) : super(key: key);

  final List<PieChartSectionData> pieChartSectionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Packages Status Chart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(pieChartSectionData: pieChartSectionData),
          PackageStatusInfoCard(
            title: "Enregistrée",
            amountOfPackages: "4",
            color: primaryColor,
          ),
          PackageStatusInfoCard(
            title: "Chargée",
            amountOfPackages: "8",
            color: kPrimaryColor,
          ),
          PackageStatusInfoCard(
            title: "Reçue",
            amountOfPackages: "22",
            color: Colors.green,
          ),
          PackageStatusInfoCard(
            title: "Livrée",
            amountOfPackages: "7",
            color: Colors.brown,
          ),
          PackageStatusInfoCard(
            title: "Retour",
            amountOfPackages: "10",
            color: Colors.red,
          ),
          PackageStatusInfoCard(
            title: "Clôturée",
            amountOfPackages: "2",
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}


