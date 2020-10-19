import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@immutable
@JsonSerializable()
class Member extends Equatable {

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "image_url")
  final String imageUrl;

  @JsonKey(name: "location")
  final String location;

  Member({
    this.name, this.imageUrl, this.location
  });

  @override
  List<Object> get props => [name, imageUrl, location];

  @override
  bool get stringify => true;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

}