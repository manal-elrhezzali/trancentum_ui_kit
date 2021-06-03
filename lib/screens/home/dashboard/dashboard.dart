import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/search_field.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'components/all_packages_status.dart';
import 'components/my_shipments.dart';
import 'components/recent_expeditions_array.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartSectionData = [
      PieChartSectionData(
        //enregistree
        value: 25,
        color: primaryColor,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        //chargee
        value: 20,
        color: kPrimaryColor,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        //recue
        value: 10,
        color: Colors.green,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        //livree
        value: 20,
        color: Colors.brown,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        //retour
        value: 15,
        color: Colors.red,
        showTitle: false,
        radius: 13,
      ),
      PieChartSectionData(
        //cloturee
        value: 18,
        color: Colors.orange,
        showTitle: false,
        radius: 10,
      ),
    ];
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SearchField(),
            // Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyShipments(),
                      SizedBox(height: defaultPadding),
                      RecentExpeditionsArray(),
                      if (ResponsiveWidget.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isMobile(context))
                        AllPackagesStatus(
                            pieChartSectionData: pieChartSectionData),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!ResponsiveWidget.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: AllPackagesStatus(
                        pieChartSectionData: pieChartSectionData),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
