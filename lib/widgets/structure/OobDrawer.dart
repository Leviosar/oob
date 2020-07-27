import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oob/widgets/general/OobUserAvatar.dart';

import 'OobDrawerItem.dart';

class OobDrawer extends StatelessWidget {

  List<OobDrawerItem> items = [];

  OobDrawer() {
    this.items.add(OobDrawerItem(title: "Experiências", icon: FontAwesomeIcons.chalkboardTeacher));
    this.items.add(OobDrawerItem(title: "Perfil", icon: FontAwesomeIcons.userAstronaut));
    this.items.add(OobDrawerItem(title: "Extras", icon: FontAwesomeIcons.gamepad));
    this.items.add(OobDrawerItem(title: "Opções", icon: FontAwesomeIcons.cog));
    this.items.add(OobDrawerItem(title: "Sair", icon: FontAwesomeIcons.signOutAlt));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          this.buildHeader(),
          ... this.items
        ],
      ),
    );
  }

  Widget buildHeader() {
    return DrawerHeader(
      child: OobUserAvatar(),
    );
  }
}