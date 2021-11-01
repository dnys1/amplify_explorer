import 'dart:convert';

import 'package:amplify_explorer/model/transform_request.dart';
import 'package:amplify_explorer/model/transform_response.dart';
import 'package:http/http.dart' as http;

class TransformException implements Exception {
  const TransformException(this.message);

  final String message;
}

class TransformService {
  static final _client = http.Client();
  static final _baseUrl =
      Uri.parse('https://s81n5osnd9.execute-api.us-west-2.amazonaws.com/dev/');

  Future<TransformResponse> transform(TransformRequest request) async {
    final requestBody = jsonEncode(request);
    final resp = await _client.post(
      _baseUrl.resolve('graphql'),
      body: requestBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (resp.statusCode != 200) {
      throw TransformException(resp.body);
    }
    final body = resp.body;
    return TransformResponse.fromJson(jsonDecode(body));
  }
}
