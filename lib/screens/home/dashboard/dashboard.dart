import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/data/expeditions.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/screens/home/dashboard/components/search_field.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'components/all_packages_status.dart';
import 'components/my_shipments.dart';
import 'components/recent_expeditions_array.dart';

class Dashboard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  int expeditionEnregistreeCount = 0;
  int expeditionRecueCount = 0;
  int expeditionChargeeCount = 0;
  int expeditionLivreeCount = 0;
  int expeditionRetourCount = 0;
  int expeditionClotureeCount = 0;

  demoExpeditions.forEach((element) {
      if (element.etat == Etat.Chargee) {
        expeditionChargeeCount++;
      }
      if (element.etat == Etat.Enregistree) {
        expeditionEnregistreeCount++;
      }
      if (element.etat == Etat.Recue) {
        expeditionRecueCount++;
      }
      if (element.etat == Etat.Livree) {
        expeditionLivreeCount++;
      }
      if (element.etat == Etat.Retour) {
        expeditionRetourCount++;
      }
      if (element.etat == Etat.Cloturee) {
        expeditionClotureeCount++;
      }});
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
                      MyShipments(expeditionChargeeCount: expeditionChargeeCount, expeditionClotureeCount: expeditionClotureeCount, expeditionEnregistreeCount: expeditionEnregistreeCount, expeditionLivreeCount: expeditionLivreeCount, expeditionRecueCount: expeditionRecueCount, expeditionRetourCount: expeditionRetourCount,),
                      SizedBox(height: defaultPadding),
                      RecentExpeditionsArray(),
                      if (ResponsiveWidget.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isMobile(context))
                        AllPackagesStatus(expeditionChargeeCount: expeditionChargeeCount, expeditionClotureeCount: expeditionClotureeCount, expeditionEnregistreeCount: expeditionEnregistreeCount, expeditionLivreeCount: expeditionLivreeCount, expeditionRecueCount: expeditionRecueCount, expeditionRetourCount: expeditionRetourCount,),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!ResponsiveWidget.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: AllPackagesStatus(expeditionChargeeCount: expeditionChargeeCount, expeditionClotureeCount: expeditionClotureeCount, expeditionEnregistreeCount: expeditionEnregistreeCount, expeditionLivreeCount: expeditionLivreeCount, expeditionRecueCount: expeditionRecueCount, expeditionRetourCount: expeditionRetourCount,),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
