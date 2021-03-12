import 'package:flutter/material.dart';
import 'package:todoapp/pages/onboardinglayout.dart';
import 'package:todoapp/pages/splashpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Set the next page to load after initial splash screen
  var nextPage = OnboardingLayout();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: SplashScreen(nextScreen: nextPage, delayInSeconds: 3),
    );
  }
}
