import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:oob/models/Experience.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;

class ExperienceBloc extends BlocBase {
  // ignore: close_sinks
  BehaviorSubject<List<Experience>> experiences = BehaviorSubject<List<Experience>>();

  ExperienceBloc();

  void fetchLocalExperiences() async {
    String content = await rootBundle.loadString('assets/config/experiences/the_adventures_of_pi.json');
    List<Experience> experiences = [Experience.fromJson(json.decode(content))];
    this.experiences.add(experiences);
  }

  @override
  void dispose() {
    this.experiences.close();
    super.dispose();
  }
}
