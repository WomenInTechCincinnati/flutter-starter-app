import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter_app/app/clients/wwcode_api_client.dart';
import 'package:flutter_app/data/models/member.dart';
import 'package:flutter_app/data/models/quote.dart';
import 'package:flutter_app/utils/app_exception.dart';
import 'package:http/http.dart';

class WWCodeApiInteractor {
  final WWCodeApiClient _apiClient;

  WWCodeApiInteractor(this._apiClient);

  Future<Result<List<Member>>> getAllMembers() async {
    final Future<Response> networkAction = _apiClient.get(
      _apiClient.url('/wwcode-cincy-database/members'),
    );

    return _runNetworkAction(networkAction.then((response) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Member.fromJson(e)).toList();
    }));
  }

  Future<Result<List<Quote>>> getAllQuotes() async {
    final Future<Response> networkAction = _apiClient.get(
      _apiClient.url('/wwcode-cincy-database/quotes'),
    );

    return _runNetworkAction(networkAction.then((response) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Quote.fromJson(e)).toList();
    }));
  }

  Future<Result<T>> _runNetworkAction<T>(Future<T> networkAction) {
    return Result.capture(
        networkAction.catchError((error) => throw parseError(error)));
  }
}
