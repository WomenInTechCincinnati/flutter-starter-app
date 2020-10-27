import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@immutable
@JsonSerializable()
class Quote extends Equatable {
  @JsonKey(name: "submitted_by")
  final String submittedBy;

  @JsonKey(name: "quote")
  final String quote;

  @JsonKey(name: "author")
  final String author;

  Quote({this.submittedBy, this.quote, this.author});

  //the qualities that are compared for equality
  @override
  List<Object> get props => [submittedBy, quote, author];

  @override
  bool get stringify => true;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
