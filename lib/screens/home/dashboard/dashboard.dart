import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_ui_kit/models/expedition.dart';

import 'package:trancentum_ui_kit/providers/expeditions.dart';
import 'package:trancentum_ui_kit/screens/home/dashboard/components/search_field.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'components/all_packages_status.dart';
import 'components/my_shipments.dart';
import 'components/recent_expeditions_array.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Expedition> _expeditions;
  int _expeditionEnregistreeCount;
  int _expeditionRecueCount;
  int _expeditionChargeeCount;
  int _expeditionLivreeCount;
  int _expeditionRetourCount;
  int _expeditionClotureeCount;

  @override
  Widget build(BuildContext context) {
    // print("Building...................");
    final expeditionsInfo = Provider.of<Expeditions>(context, listen: false);
    _expeditions = expeditionsInfo.items;
    return _expeditions.isEmpty
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
        : Consumer<Expeditions>(
            builder: (ctx, expeditionsData, child) {
              _expeditions = expeditionsData.items;
              _expeditionEnregistreeCount =
                  expeditionsData.nbrOfExpeditionsEnregistree;
              _expeditionRecueCount = expeditionsData.nbrOfExpeditionsRecue;
              _expeditionChargeeCount = expeditionsData.nbrOfExpeditionsChargee;
              _expeditionLivreeCount = expeditionsData.nbrOfExpeditionsLivree;
              _expeditionRetourCount = expeditionsData.nbrOfExpeditionsRetour;
              _expeditionClotureeCount =
                  expeditionsData.nbrOfExpeditionsCloturee;
              return Center(
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
                                  expeditionChargeeCount:
                                      _expeditionChargeeCount,
                                  expeditionClotureeCount:
                                      _expeditionClotureeCount,
                                  expeditionEnregistreeCount:
                                      _expeditionEnregistreeCount,
                                  expeditionLivreeCount: _expeditionLivreeCount,
                                  expeditionRecueCount: _expeditionRecueCount,
                                  expeditionRetourCount: _expeditionRetourCount,
                                ),
                                SizedBox(height: defaultPadding),
                                // RecentExpeditionsArray(),
                                child,
                                if (ResponsiveWidget.isMobile(context))
                                  SizedBox(height: defaultPadding),
                                if (_expeditionChargeeCount != 0 &&
                                    _expeditionClotureeCount != 0 &&
                                    _expeditionEnregistreeCount != 0 &&
                                    _expeditionLivreeCount != 0 &&
                                    _expeditionRecueCount != 0 &&
                                    _expeditionRetourCount != 0)
                                  if (ResponsiveWidget.isMobile(context))
                                    AllPackagesStatus(
                                      expeditionChargeeCount:
                                          _expeditionChargeeCount,
                                      expeditionClotureeCount:
                                          _expeditionClotureeCount,
                                      expeditionEnregistreeCount:
                                          _expeditionEnregistreeCount,
                                      expeditionLivreeCount:
                                          _expeditionLivreeCount,
                                      expeditionRecueCount:
                                          _expeditionRecueCount,
                                      expeditionRetourCount:
                                          _expeditionRetourCount,
                                    ),
                              ],
                            ),
                          ),
                          if (!ResponsiveWidget.isMobile(context))
                            SizedBox(width: defaultPadding),
                          if (_expeditionChargeeCount != 0 &&
                              _expeditionClotureeCount != 0 &&
                              _expeditionEnregistreeCount != 0 &&
                              _expeditionLivreeCount != 0 &&
                              _expeditionRecueCount != 0 &&
                              _expeditionRetourCount != 0)
                            if (!ResponsiveWidget.isMobile(context))
                              Expanded(
                                flex: 2,
                                child: AllPackagesStatus(
                                  expeditionChargeeCount:
                                      _expeditionChargeeCount,
                                  expeditionClotureeCount:
                                      _expeditionClotureeCount,
                                  expeditionEnregistreeCount:
                                      _expeditionEnregistreeCount,
                                  expeditionLivreeCount: _expeditionLivreeCount,
                                  expeditionRecueCount: _expeditionRecueCount,
                                  expeditionRetourCount: _expeditionRetourCount,
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            child: RecentExpeditionsArray(),
          );
  }
}
