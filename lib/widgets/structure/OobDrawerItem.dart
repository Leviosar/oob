import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oob/themes/OobColors.dart';

class OobDrawerItem extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final Function callback;

  const OobDrawerItem({Key key, this.title, this.subtitle, this.icon, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title ?? ""),
      subtitle: Text(this.subtitle ?? ""),
      leading: Icon(this.icon, color: OobColors.lightBlue),
      onTap: this.callback,
    );
  }
}