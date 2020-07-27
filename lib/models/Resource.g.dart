// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    json['name'] as String,
    json['value'],
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
