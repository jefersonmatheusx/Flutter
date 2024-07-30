import 'dart:io';

import 'package:expenses/theme/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showChart = false;
  final Function() showChartFunction;
  final Function openTransactionFormModal;
  BuildContext? context;
  final ThemeManager themeManager;
  AdaptativeAppBar(
      {super.key,
      required this.themeManager,
      required this.showChartFunction,
      required this.openTransactionFormModal,
      this.context});

  double appBarHeight(context) {
    return _getAppBar(context).preferredSize.height;
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  PreferredSizeWidget _getAppBar(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isIOS = Platform.isIOS;
    IconData chartIcon;

    if (showChart) {
      chartIcon = !isIOS ? Icons.list : CupertinoIcons.square_list_fill;
    } else {
      chartIcon = !isIOS ? Icons.pie_chart : CupertinoIcons.chart_bar_circle;
    }

    final actions = <Widget>[
      if (isLandscape) _getIconButton(chartIcon, showChartFunction),
      _getIconButton(!isIOS ? Icons.add : CupertinoIcons.add,
          () => openTransactionFormModal(context)),
    ];

    if (isIOS) {
      return CupertinoNavigationBar(
        middle: Text('Despesas pessoais'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
      );
    } else {
      return AppBar(
        actions: <Widget>[
          ...actions,
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeManager.toggleTheme(value);
            },
          ),
        ],
        // backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Despesas pessoais',
        ),
      ) as PreferredSizeWidget;
    }
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: fn,
            child: Icon(icon),
          )
        : IconButton(
            icon: Icon(icon),
            onPressed: fn,
          );
  }

  @override
  Widget build(BuildContext context) {
    return _getAppBar(context);
  }
}
