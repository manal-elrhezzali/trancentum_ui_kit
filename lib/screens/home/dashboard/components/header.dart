import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trancentum_ui_kit/components/profile_card.dart';
import 'package:trancentum_ui_kit/controllers/menu_controller.dart';
import 'package:trancentum_ui_kit/responsive_widget.dart';
import 'package:trancentum_ui_kit/screens/expedition_detail/components/search_field.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!ResponsiveWidget.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!ResponsiveWidget.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!ResponsiveWidget.isMobile(context))
          Spacer(flex: ResponsiveWidget.isDesktop(context) ? 2 : 1),
        Expanded(
          child: SearchField(),
        ),
        if (!ResponsiveWidget.isMobile(context)) ProfileCard(),
      ],
    );
  }
}



