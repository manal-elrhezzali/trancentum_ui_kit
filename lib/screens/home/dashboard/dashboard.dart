import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/data/expeditions.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/screens/home/dashboard/components/search_field.dart';
import 'package:trancentum_ui_kit/screens/new_expedition/new_expedition_screen.dart';

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
      }
    });
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: demoExpeditions.isEmpty
            ? Column(
                children: [
                  SearchField(),
                  SizedBox(height: defaultPadding),
                  Text("demoExpeditions is empty"),
                  //change this button style
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(NewExpeditionScreen.routeName);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (ResponsiveWidget.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    icon: Icon(Icons.add),
                    label: Text("Nouvelle Expédition"),
                  ), // replace it with the zzzz image
                  // and add a new expedition button
                ],
              )
            : Column(
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
                            MyShipments(
                              expeditionChargeeCount: expeditionChargeeCount,
                              expeditionClotureeCount: expeditionClotureeCount,
                              expeditionEnregistreeCount:
                                  expeditionEnregistreeCount,
                              expeditionLivreeCount: expeditionLivreeCount,
                              expeditionRecueCount: expeditionRecueCount,
                              expeditionRetourCount: expeditionRetourCount,
                            ),
                            SizedBox(height: defaultPadding),
                            RecentExpeditionsArray(),
                            if (ResponsiveWidget.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (expeditionChargeeCount != 0 &&
                                expeditionClotureeCount != 0 &&
                                expeditionEnregistreeCount != 0 &&
                                expeditionLivreeCount != 0 &&
                                expeditionRecueCount != 0 &&
                                expeditionRetourCount != 0)
                              if (ResponsiveWidget.isMobile(context))
                                AllPackagesStatus(
                                  expeditionChargeeCount:
                                      expeditionChargeeCount,
                                  expeditionClotureeCount:
                                      expeditionClotureeCount,
                                  expeditionEnregistreeCount:
                                      expeditionEnregistreeCount,
                                  expeditionLivreeCount: expeditionLivreeCount,
                                  expeditionRecueCount: expeditionRecueCount,
                                  expeditionRetourCount: expeditionRetourCount,
                                ),
                          ],
                        ),
                      ),
                      if (!ResponsiveWidget.isMobile(context))
                        SizedBox(width: defaultPadding),
                      if (expeditionChargeeCount != 0 &&
                          expeditionClotureeCount != 0 &&
                          expeditionEnregistreeCount != 0 &&
                          expeditionLivreeCount != 0 &&
                          expeditionRecueCount != 0 &&
                          expeditionRetourCount != 0)
                        if (!ResponsiveWidget.isMobile(context))
                          Expanded(
                            flex: 2,
                            child: AllPackagesStatus(
                              expeditionChargeeCount: expeditionChargeeCount,
                              expeditionClotureeCount: expeditionClotureeCount,
                              expeditionEnregistreeCount:
                                  expeditionEnregistreeCount,
                              expeditionLivreeCount: expeditionLivreeCount,
                              expeditionRecueCount: expeditionRecueCount,
                              expeditionRetourCount: expeditionRetourCount,
                            ),
                          ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
