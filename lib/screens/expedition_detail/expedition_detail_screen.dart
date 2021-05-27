import 'package:flutter/material.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/body.dart';

class ExpeditionDetailScreen extends StatelessWidget {
  static String routeName = "/expedition_detail_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expedition Detail"),
      ),
      body: Body(),
    );
  }
}
