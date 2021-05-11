import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxfund_alpha/ui/screens/main_layout_screen.dart';
import 'package:foxfund_alpha/ui/screens/splash_screen.dart';

import 'constants/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView:
      return _getPageRoute(
          routeName: settings.name, view: const SplashScreen());
    case MainLayoutView:
      return _getPageRoute(
          routeName: settings.name,
          args: settings.arguments,
          view: const MainLayoutScreen());

    default:
      return Platform.isIOS
          ? CupertinoPageRoute<dynamic>(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
            )
          : MaterialPageRoute<dynamic>(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
            );
  }
}

PageRoute<dynamic> _getPageRoute({String routeName, Widget view, Object args}) {
  return Platform.isIOS
      ? CupertinoPageRoute<dynamic>(
          settings: RouteSettings(name: routeName, arguments: args),
          builder: (_) => view)
      : MaterialPageRoute<dynamic>(
          settings: RouteSettings(name: routeName, arguments: args),
          builder: (_) => view);
}

void moveTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<dynamic>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void moveToReplace(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.pushReplacement<dynamic, dynamic>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}
