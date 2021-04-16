import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/models/response/getUserResponse.dart';
import 'package:todoapp/core/models/response/userResponse.dart';
import 'package:todoapp/ui/pages/basicLayout.dart';
import 'package:todoapp/ui/pages/homepage.dart';
import 'package:todoapp/ui/pages/onboardpage.dart';
import 'package:todoapp/ui/pages/splashpage.dart';

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  // Set the next page to load after initial splash screen
  //var nextPage = OnboardingLayout();
  var nextPage = BasicLayout(page: OnboardingPage());

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserResponse>(context);

    //  the var user is a future, so we need to wait for
    // it to complete, in the meantime show a loader
    if(user == null){
      //  loading app
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Container(
                child: Image.asset("assets/images/aking.png"),
              ),*/
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                "Loading app",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ],
          ),
        ),
      );
    }else{
      if(user.success){
        return BasicLayout(page: HomePage());
      }
      return SplashPage(nextScreen: nextPage, delayInSeconds: 1);
    }


  }
}
