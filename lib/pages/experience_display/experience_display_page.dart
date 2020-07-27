import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:math' as math;

import '../../models/Experience.dart';
import '../../models/ExperienceStep.dart';
import '../../models/Subject.dart';
import '../../scenes/MathPiScene.dart';
import '../../themes/HTMLStyle.dart';
import '../../themes/OobColors.dart';

class ExperienceDisplayPage extends StatefulWidget {
  final Experience experience;

  const ExperienceDisplayPage({Key key, this.experience}) : super(key: key);

  @override
  _ExperienceDisplayPageState createState() => _ExperienceDisplayPageState();
}

class _ExperienceDisplayPageState extends State<ExperienceDisplayPage> {

  int currentProgressIndex = 0;
  CarouselController carouselController = CarouselController();

  void updateProgressIndex(int newIndex, CarouselPageChangedReason reason) => setState(() => currentProgressIndex = newIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OobColors.mediumBlue,
      appBar: AppBar(
        title: Text(this.widget.experience.title),
      ),
      body: this.buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          this.buildSubjectsBadges(this.widget.experience.subjects),
          this.buildProgressDots(this.widget.experience.steps),
          this.buildStepsCarousel(this.widget.experience.steps, context)
        ],
      ),
    );
  }

  Widget buildSubtitle(BuildContext context) {
    return Padding(
      child: Text(
        this.widget.experience.subtitle,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    );
  }

  Widget buildStepsCarousel(List<ExperienceStep> steps, BuildContext context) {
    return CarouselSlider(
      carouselController: this.carouselController,
      options: CarouselOptions(
        viewportFraction: 1.0,
        onPageChanged: this.updateProgressIndex,
        enableInfiniteScroll: false,
        height: 400
      ),
      items: steps.map((ExperienceStep step) {
        if (step.hasCanvas) {
          return MathPiScene(
            Size(MediaQuery.of(context).size.width, 400)
          ).widget;    
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Html(
              data: step.text,
              style: HTMLStyle.experienceStyles,
            ),
          );
        }
      }).toList(),
    );
  }

  Widget buildSubjectsBadges(List<Subject> subjects) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: subjects.map(
        (Subject subject) => Chip(
          label: Text(subject.name, style: TextStyle(color: Colors.white, fontSize: 16.0)),
          backgroundColor: subject.color,
        )
      ).toList(),
    );
  }

  Widget buildProgressDots(List<ExperienceStep> steps) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: InkWell(
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == this.currentProgressIndex ? this.widget.experience.subjects.first.color : Colors.white
                ),
              ),
              onTap: () {
                this.carouselController.animateToPage(index, duration: Duration(milliseconds: 100 * (currentProgressIndex - index).abs()), curve: Curves.easeIn);
              },
            ),
          )
        )
      ),
    );
  }
}