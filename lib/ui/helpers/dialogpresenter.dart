import 'package:flutter/material.dart';

class DialogPresenter extends StatefulWidget {
  final Widget child;
  DialogPresenter({Key key, this.child}):super(key: key);
  @override
  _DialogPresenterState createState() => _DialogPresenterState();
}

class _DialogPresenterState extends State<DialogPresenter> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
