import 'package:flutter/material.dart';

class OobListTileTrailingBadge extends StatelessWidget {
  
  final Widget child;
  final Color color;

  const OobListTileTrailingBadge({Key key, this.color, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      decoration: BoxDecoration(
        color: this.color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
    );
  }
}