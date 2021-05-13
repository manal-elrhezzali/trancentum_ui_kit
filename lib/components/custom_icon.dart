import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: IconButton(
        icon: visibility == false
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            visibility = !visibility;
          });
        },
      ),
    );
  }
}
