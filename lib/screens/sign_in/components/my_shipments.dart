import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/models/PackageStatusInfo.dart';
import 'package:trancentum_ui_kit/responsive.dart';
import 'package:trancentum_ui_kit/screens/dashboard/components/header_package_info_card.dart';

import '../../../constants.dart';

class MyShipments extends StatelessWidget {
  MyShipments({
    Key key,
  }) : super(key: key);

  final List<PackagesStatusInfo> demoMyPackages = [
    PackagesStatusInfo(
      title: "Enregistrée",
      numOfPackages: 4,
      color: primaryColor,
    ),
    PackagesStatusInfo(
      title: "Chargée",
      numOfPackages: 8,
      color: kPrimaryColor,
    ),
    PackagesStatusInfo(
      title: "Reçue",
      numOfPackages: 22,
      color: Colors.green,
    ),
    PackagesStatusInfo(
      title: "Livrée",
      numOfPackages: 7,
      color: Colors.brown,
    ),
    PackagesStatusInfo(
      title: "Retour",
      numOfPackages: 10,
      color: Colors.red,
    ),
    PackagesStatusInfo(
      title: "Clôturée",
      numOfPackages: 2,
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mes Expéditions",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //navigate to new expedition screen
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              icon: Icon(Icons.add),
              label: Text("Nouvelle Expédition"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: PackageStatusInfoCardGridView(
            demoMyPackages: demoMyPackages,
            crossAxisCount: _size.width < 650 ? 3 : 6,
            childAspectRatio: _size.width < 650 ? 0.8 : 0.6,
          ),
          tablet: PackageStatusInfoCardGridView(
            demoMyPackages: demoMyPackages,
          ),
          desktop: PackageStatusInfoCardGridView(
            demoMyPackages: demoMyPackages,
            childAspectRatio: _size.width < 1400 ? 0.7 : 0.9,
          ),
        ),
      ],
    );
  }
}

class PackageStatusInfoCardGridView extends StatelessWidget {
  const PackageStatusInfoCardGridView({
    Key key,
    @required this.demoMyPackages,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final List<PackagesStatusInfo> demoMyPackages;

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: demoMyPackages.length, //dummy data
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => HeaderPackageInfoCard(
        info: demoMyPackages[index],
        myPackages: demoMyPackages,
      ),
    );
  }
}
