import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {

  final Widget page;

  BasicLayout({Key key, @required this.page });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'avenir'
      ),
      home: page,
    );
  }
}
