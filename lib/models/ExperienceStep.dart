import 'package:json_annotation/json_annotation.dart';

part 'ExperienceStep.g.dart';

@JsonSerializable()

class ExperienceStep {
  bool hasCanvas;
  String text;

  ExperienceStep(this.text, this.hasCanvas);

  factory ExperienceStep.fromJson(Map<String, dynamic> json) => _$ExperienceStepFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceStepToJson(this);
}