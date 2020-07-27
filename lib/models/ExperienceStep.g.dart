// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExperienceStep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceStep _$ExperienceStepFromJson(Map<String, dynamic> json) {
  return ExperienceStep(
    json['text'] as String,
    json['hasCanvas'] as bool,
  );
}

Map<String, dynamic> _$ExperienceStepToJson(ExperienceStep instance) =>
    <String, dynamic>{
      'hasCanvas': instance.hasCanvas,
      'text': instance.text,
    };
