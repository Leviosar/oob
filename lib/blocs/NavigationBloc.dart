import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class NavigationBloc extends BlocBase {
  
  void pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => page)
    );
  }
}