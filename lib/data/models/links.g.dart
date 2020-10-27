// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    twitter: json['twitter'] as String,
    facebook: json['facebook'] as String,
    linkedin: json['linkedIn'] as String,
    github: json['github'] as String,
    meetup: json['meetup'] as String,
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'linkedIn': instance.linkedin,
      'github': instance.github,
      'meetup': instance.meetup,
      'website': instance.website,
    };
