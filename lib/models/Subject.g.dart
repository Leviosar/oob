// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(
    ColorSerializer.fromJson(json['color']),
    json['name'] as String,
    (json['relatedSubjects'] as List)
        ?.map((e) =>
            e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'color': ColorSerializer.toJson(instance.color),
      'relatedSubjects':
          instance.relatedSubjects?.map((e) => e?.toJson())?.toList(),
    };
