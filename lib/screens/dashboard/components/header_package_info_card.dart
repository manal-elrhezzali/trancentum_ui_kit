import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_ui_kit/models/PackageStatusInfo.dart';
import 'package:trancentum_ui_kit/screens/dashboard/components/progress_line.dart';

import '../../../constants.dart';

class HeaderPackageInfoCard extends StatelessWidget {
  const HeaderPackageInfoCard({
    Key key,
    @required this.info,
    @required this.myPackages,
  }) : super(key: key);

  final PackagesStatusInfo info;
  final List<PackagesStatusInfo> myPackages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10 * 0.75),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: info.color.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc,
                  color: info.color,
                ),
              ),
            ],
          ),
          Text(
            info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
          ProgressLine(
            info: info,
            myPackages: myPackages,
          ),
          Text(
            info.nbrOfPackages.toString(),
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}

