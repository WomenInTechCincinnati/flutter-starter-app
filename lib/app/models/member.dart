import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@immutable
@JsonSerializable()
class Member extends Equatable {

  @JsonKey(name: "name")
  final String name; 
  
  Member({
    this.name
  });

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

}