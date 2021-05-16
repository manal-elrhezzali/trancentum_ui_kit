import 'package:flutter/material.dart';

import '../../constants.dart';
import './components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
          ],
        ),
      ),
    );
  }
}

