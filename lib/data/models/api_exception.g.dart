// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIException _$APIExceptionFromJson(Map<String, dynamic> json) {
  return APIException(
    json['status'] as int,
    json['message'] as String,
    (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : APIExceptionReason.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$APIExceptionToJson(APIException instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

APIExceptionReason _$APIExceptionReasonFromJson(Map<String, dynamic> json) {
  return APIExceptionReason(
    json['path'] as String,
    json['message'] as String,
    json['errorCode'] as String,
  );
}

Map<String, dynamic> _$APIExceptionReasonToJson(APIExceptionReason instance) =>
    <String, dynamic>{
      'path': instance.path,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };
