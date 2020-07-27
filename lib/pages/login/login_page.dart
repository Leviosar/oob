import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:oob/blocs/ExperienceBloc.dart';
import 'package:oob/blocs/NavigationBloc.dart';
import 'package:oob/pages/experience_list/experience_list_page.dart';
import 'package:oob/widgets/general/OoButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.getBloc<ExperienceBloc>().fetchLocalExperiences();

    return Scaffold(
      body: SafeArea(
        child: this.buildBody(context)
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Image.asset(
                "assets/images/logos/oob_logo.png",
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 40.0),
              this.buildLoginForm(context)
            ],
          ),
        ]
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 40.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                child: Icon(
                  this.showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () => setState(() => this.showPassword = !this.showPassword),
              )
            ),
            obscureText: this.showPassword,
          ),
          SizedBox(height: 40.0),
          OoButton(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Entrar", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            ),
            onTap: () async {
              BlocProvider.getBloc<NavigationBloc>().pushPage(context, ExperienceListPage());
            }
          ),
          SizedBox(height: 40.0),
          OoButton(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Cadastre-se", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
            ),
            onTap: () {
              BlocProvider.getBloc<NavigationBloc>().pushPage(context, ExperienceListPage());
            }
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}