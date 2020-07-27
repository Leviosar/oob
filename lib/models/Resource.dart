import 'package:json_annotation/json_annotation.dart';

part 'Resource.g.dart';

@JsonSerializable()

class Resource {
  String name;
  dynamic value;

  Resource(this.name, this.value);

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}