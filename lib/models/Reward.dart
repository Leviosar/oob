import 'package:json_annotation/json_annotation.dart';

import 'Resource.dart';

part 'Reward.g.dart';

@JsonSerializable(explicitToJson: true)

class Reward {
  String name;
  List<Resource> resources;

  Reward(this.name, this.resources);

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}