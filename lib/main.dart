import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/models/response/getUserResponse.dart';
import 'package:todoapp/core/services/authenticationManager.dart';
import 'package:todoapp/core/services/navigationManager.dart';
import 'package:todoapp/ui/pages/basicLayout.dart';
import 'package:todoapp/ui/pages/onboardpage.dart';
import 'package:todoapp/ui/pages/rootpage.dart';
import 'package:todoapp/ui/pages/splashpage.dart';
import 'package:todoapp/ui/routing/router.dart';

import 'core/models/response/userResponse.dart';
import 'locator.dart';

void main() {
  //  call setupLocator before we run the app
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationManager>().navigationKey,
      debugShowCheckedModeBanner: false,
      /*title: 'WheelznStuff',*/
      home: MultiProvider(
        // User multiProvider to make the code more readable and
        //  avoid nestinag
        providers: [
          //FutureProvider<GetUserResponse>(create: (context) => AuthenticationManager().getUser())
          FutureProvider<UserResponse>(create: (context) => AuthenticationManager().getUser()),
          /*FutureProvider<GetUserResponse>(
            create: (_) => AuthenticationManager().getUser()
          )*/
        ],
        child: RootView(),
      ),
      onGenerateRoute: generateRoute,
    );
    /*return StreamProvider<AppUser>(
      initialData: AppUser.initial(),
      //  The user can now be consumed anywhere in the app by using Provider.of<User>(context)
      create: (context) => locator<AuthenticationManager>().userStreamController.stream,
      child: MaterialApp(
        navigatorKey: locator<NavigationManager>().navigationKey,
        debugShowCheckedModeBanner: false,
        /*title: 'WheelznStuff',*/
        home: SplashPage(nextScreen: nextPage, delayInSeconds: 1),
        onGenerateRoute: generateRoute,
      ),
    );*/
  }
}
