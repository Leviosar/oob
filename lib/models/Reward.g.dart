// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reward _$RewardFromJson(Map<String, dynamic> json) {
  return Reward(
    json['name'] as String,
    (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'name': instance.name,
      'resources': instance.resources?.map((e) => e?.toJson())?.toList(),
    };
