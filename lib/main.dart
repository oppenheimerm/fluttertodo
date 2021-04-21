import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/services/authenticationManager.dart';
import 'package:todoapp/core/services/navigationManager.dart';
import 'package:todoapp/ui/pages/rootpage.dart';
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
        //  avoid nesting
        providers: [
          /*FutureProvider<UserResponse>(create: (context) => AuthenticationManager().getUser()),*/
          FutureProvider<UserResponse>(
            create: (context) => AuthenticationManager().getUser(),
            initialData: AppUser.initialDataUserResponse(),
          )
          /*FutureProvider<GetUserResponse>(
            create: (_) => AuthenticationManager().getUser()
          )*/
        ],
        child: RootView(),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
