import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/data/dummyExpeditions.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';
import 'package:trancentum_ui_kit/screens/home/dashboard/components/search_field.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'components/all_packages_status.dart';
import 'components/header.dart';
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
    return demoExpeditions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  SearchField(),
                  SizedBox(height: defaultPadding),
                  Text(
                    "No shippments added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        : Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  SearchField(),
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
