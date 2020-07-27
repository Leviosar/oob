// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['name'] as String,
    (json['relatedTags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ColorSerializer.fromJson(json['color']),
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'relatedTags': instance.relatedTags?.map((e) => e?.toJson())?.toList(),
      'color': ColorSerializer.toJson(instance.color),
    };
