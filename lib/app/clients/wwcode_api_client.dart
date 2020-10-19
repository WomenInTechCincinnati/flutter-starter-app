import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/data/models/api_exception.dart';
import 'package:flutter_app/utils/app_exception.dart';
import 'package:flutter_app/values/variants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WWCodeApiClient extends http.BaseClient {
  final http.Client _client = http.Client();

  final Variant _variant;

  WWCodeApiClient(
      this._variant,
      );

  String url(String path) => '${_variant.baseUrl}$path';

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {

    request.headers["Accept"] = "application/json";

    if (request.contentLength > 0) {
      request.headers["Content-Type"] = "application/json";
    }

    return _client.send(request).then((streamResponse) async {
      // Client errors
      if (streamResponse.statusCode == 400) {
        final response = await Response.fromStream(streamResponse);
        final Map<String, dynamic> json = jsonDecode(response.body);
        throw APIException.fromJson(json);
      }

      // Any other unexpected responses
      if (streamResponse.statusCode != 200) {
        throw NetworkException(
            "Unexpected API response: ${request.method} ${request.url} returned ${streamResponse.statusCode}");
      } else {
        return streamResponse;
      }
    });
  }
}
