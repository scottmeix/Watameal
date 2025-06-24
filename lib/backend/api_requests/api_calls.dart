import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OpenaiCall {
  static Future<ApiCallResponse> call({
    String? instruction =
        'I have eggs, chicken, soy sauce, tomato, potato, rice, noodle, I want to cook  a meat lunch under 30mins.',
    dynamic? functionsJson,
    String? apiKey =
        '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',
    String? instructionDev = '',
  }) async {
    final functions = _serializeJson(functionsJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini",
  "messages": [
    {
      "role": "developer",
      "content": "${escapeStringForJson(instructionDev)}"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(instruction)}"
    }
  ],
  "temperature": 0.5,
  "n": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Openai',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.function_call.arguments''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class OpenaiImageCall {
  static Future<ApiCallResponse> call({
    String? instruction = 'a delicious dish',
    String? apiKey =
        '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',
    String? model = 'dall-e-3',
    int? number = 1,
  }) async {
    final ffApiRequestBody = '''
{
  "model": "${escapeStringForJson(model)}",
  "prompt": "${escapeStringForJson(instruction)}",
  "n": ${number},
  "size": "1024x1024"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Openai Image',
      apiUrl: 'https://api.openai.com/v1/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? urlList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
