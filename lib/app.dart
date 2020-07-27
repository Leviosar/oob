import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:oob/blocs/NavigationBloc.dart';
import 'package:oob/pages/login/login_page.dart';
import 'package:oob/themes/MainTheme.dart';

import 'blocs/ExperienceBloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "OOB",
        theme: MainTheme().instance,
        home: LoginPage(),
      ),
      blocs: this.instanceBlocs(),
    );
  }

  List<Bloc<dynamic>> instanceBlocs() {
    return [
      Bloc((i) => ExperienceBloc()),
      Bloc((i) => NavigationBloc()),
    ];
  }
}