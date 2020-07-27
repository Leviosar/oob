import 'package:flutter/material.dart';
import 'package:oob/themes/OobColors.dart';

class OoButton extends StatefulWidget {
  final Widget child;
  final Function onTap;

  OoButton({this.child, this.onTap});
  
  @override
  _OoButtonState createState() => _OoButtonState();
}

class _OoButtonState extends State<OoButton> {

  double yTranslationContainerPosition = 0;
  double yTranslationBoxShadowOffset = 10.0;
  double yTranslationIncrement = 10.0;

  void pressAnimation() {
    setState(() {
      this.yTranslationContainerPosition += yTranslationIncrement;
      this.yTranslationBoxShadowOffset -= yTranslationIncrement;
    });
  }

  void releaseAnimation() {
    setState(() {
      this.yTranslationContainerPosition -= yTranslationIncrement;
      this.yTranslationBoxShadowOffset += yTranslationIncrement;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        child: this.widget.child ?? Container(),
        transform: Matrix4.translationValues(0, this.yTranslationContainerPosition, 0.0),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(color: OobColors.darkBlue, offset: Offset(0, this.yTranslationBoxShadowOffset))
          ]
        ),
      ),
      onTap: () {
        this.pressAnimation();

        Future.delayed(Duration(milliseconds: 200), this.releaseAnimation);

        Function.apply(this.widget.onTap, []);
      },
    );
  }
}