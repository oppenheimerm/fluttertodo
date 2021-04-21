import 'package:flutter/material.dart';
import 'package:todoapp/ui/pages/basicLayout.dart';
import 'package:todoapp/ui/pages/homepage.dart';
import 'package:todoapp/ui/pages/loginpage.dart';
import 'package:todoapp/ui/routing/routeNames.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: BasicLayout(page: LoginPage()) ,
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow!);
}