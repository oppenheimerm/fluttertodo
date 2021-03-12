import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  final Widget nextScreen;
  final int delayInSeconds;

  const SplashScreen({
    Key key,
    @required this.nextScreen,
    @required this.delayInSeconds
  }):super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTimer() async {
    var duration = new Duration(seconds: widget.delayInSeconds);
    return new Timer(duration, route);
  }

  //  Callback function used in [startTimer]
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(
      builder: (context) => widget.nextScreen
          )
        );
  }

  //  Our initial screen that will be shown on load
  initScreen(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/aking.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Splash Screen",
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
  }


}


//  See:  https://github.com/AminullahTajMuhammad/splash_screen_example_flutter