// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    submittedBy: json['submitted_by'] as String,
    quote: json['quote'] as String,
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'submitted_by': instance.submittedBy,
      'quote': instance.quote,
      'author': instance.author,
    };
