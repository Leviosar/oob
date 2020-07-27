import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:oob/helper/ColorSerializer.dart';

part 'Tag.g.dart';

@JsonSerializable(explicitToJson: true)

class Tag {
  String name;
  
  List<Tag> relatedTags;

  @JsonKey(toJson: ColorSerializer.toJson, fromJson: ColorSerializer.fromJson)
  Color color;

  Tag(this.name, this.relatedTags, this.color);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}