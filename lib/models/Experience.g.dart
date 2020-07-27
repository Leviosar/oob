// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return Experience(
    json['title'] as String,
    (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['steps'] as List)
        ?.map((e) => e == null
            ? null
            : ExperienceStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['rewards'] as List)
        ?.map((e) =>
            e == null ? null : Reward.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..subtitle = json['subtitle'] as String;
}

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'subjects': instance.subjects?.map((e) => e?.toJson())?.toList(),
      'steps': instance.steps?.map((e) => e?.toJson())?.toList(),
      'tags': instance.tags?.map((e) => e?.toJson())?.toList(),
      'rewards': instance.rewards?.map((e) => e?.toJson())?.toList(),
    };
