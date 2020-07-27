import 'package:json_annotation/json_annotation.dart';

import 'ExperienceStep.dart';
import 'Reward.dart';
import 'Subject.dart';
import 'Tag.dart';

part 'Experience.g.dart';

@JsonSerializable(explicitToJson: true)
class Experience {
  String title;
  String subtitle;
  List<Subject> subjects;
  List<ExperienceStep> steps;
  List<Tag> tags;
  List<Reward> rewards;

  Experience(this.title, this.subjects, this.steps, this.tags, this.rewards);

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
