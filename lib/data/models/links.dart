import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@immutable
@JsonSerializable()
class Links extends Equatable {

  @JsonKey(name: "twitter")
  final String twitter;

  @JsonKey(name: "facebook")
  final String facebook;

  @JsonKey(name: "linkedIn")
  final String linkedin;

  @JsonKey(name: "github")
  final String github;

  @JsonKey(name: "meetup")
  final String meetup;

  @JsonKey(name: "website")
  final String website;

  Links({
    this.twitter, this.facebook, this.linkedin, this.github, this.meetup, this.website
  });

  @override
  List<Object> get props => [twitter, facebook, linkedin, github, meetup, website];

  @override
  bool get stringify => true;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

}