import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/services/DialogService.dart';
import 'package:todoapp/core/services/authenticationManager.dart';
import 'package:todoapp/core/services/navigationManager.dart';
import 'package:todoapp/ui/helpers/dialogManager.dart';
import 'package:todoapp/ui/pages/basicLayout.dart';
import 'package:todoapp/ui/pages/onboardpage.dart';
import 'package:todoapp/ui/pages/splashpage.dart';
import 'package:todoapp/ui/routing/router.dart';

import 'locator.dart';

void main() {
  //  call setupLocator before we run the app
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Set the next page to load after initial splash screen
  //var nextPage = OnboardingLayout();
  var nextPage = BasicLayout(page: OnboardingPage());

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>(
      initialData: AppUser.initial(),
      //  The user can now be consumed anywhere in the app by using Provider.of<User>(context)
      create: (context) => AuthenticationManager().userStreamController.stream,
      child: MaterialApp(
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child),
        ),
      ),
      navigatorKey: locator<NavigationManager>().navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'WheelznStuff',
      home: SplashPage(nextScreen: nextPage, delayInSeconds: 3),
      onGenerateRoute: generateRoute,
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: SplashScreen(nextScreen: nextPage, delayInSeconds: 3),
    );
  }*/
}
