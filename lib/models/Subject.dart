import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:oob/helper/ColorSerializer.dart';

part 'Subject.g.dart';

@JsonSerializable(explicitToJson: true)

class Subject {
  String name;

  @JsonKey(toJson: ColorSerializer.toJson, fromJson: ColorSerializer.fromJson)
  Color color;

  List<Subject> relatedSubjects;

  Subject(this.color, this.name, this.relatedSubjects);

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  // @override
  // String toString() {
  //   return this.toJson().toString();
  // }
}