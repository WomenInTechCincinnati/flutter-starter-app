// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    name: json['name'] as String,
    imageUrl: json['image_url'] as String,
    location: json['location'] as String,
    hobbyList: (json['hobbies'] as List)?.map((e) => e as String)?.toList(),
    favoriteTechs:
        (json['favorite_techs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imageUrl,
      'location': instance.location,
      'hobbies': instance.hobbyList,
      'favorite_techs': instance.favoriteTechs,
    };
