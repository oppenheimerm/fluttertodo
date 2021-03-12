import 'package:flutter/material.dart';
import 'package:todoapp/pages/onboardpage.dart';

class OnboardingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'avenir'
        ),
      home: OnboardingPage(),
    );
  }
}
