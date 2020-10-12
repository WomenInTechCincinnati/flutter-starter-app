import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

@immutable
@JsonSerializable()
class APIException {
  @JsonKey(name: "status")
  final int status;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "errors")
  final List<APIExceptionReason> errors;

  APIException(
      this.status,
      this.message,
      this.errors,
      );

  factory APIException.fromJson(Map<String, dynamic> json) => _$APIExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$APIExceptionToJson(this);

  APIExceptionReason atPath(String path) => errors.firstWhere((element) => element.path == path);
}

@immutable
@JsonSerializable()
class APIExceptionReason {
  @JsonKey(name: "path")
  final String path;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "errorCode")
  final String errorCode;

  APIExceptionReason(
      this.path,
      this.message,
      this.errorCode,
      );

  factory APIExceptionReason.fromJson(Map<String, dynamic> json) => _$APIExceptionReasonFromJson(json);

  Map<String, dynamic> toJson() => _$APIExceptionReasonToJson(this);
}