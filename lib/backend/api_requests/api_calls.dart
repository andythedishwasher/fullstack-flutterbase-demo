import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Firebase Music Manager Group Code

class FirebaseMusicManagerGroup {
  static String baseUrl =
      'https://us-central1-fullstack-flutterbase-demo.cloudfunctions.net/musicManager';
  static Map<String, String> headers = {};
  static GetSongURLCall getSongURLCall = GetSongURLCall();
  static UploadSongCall uploadSongCall = UploadSongCall();
}

class GetSongURLCall {
  Future<ApiCallResponse> call({
    String? artist = '',
    String? song = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Song URL',
      apiUrl: '${FirebaseMusicManagerGroup.baseUrl}/${artist}/${song}',
      callType: ApiCallType.GET,
      headers: {
        ...FirebaseMusicManagerGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic downloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class UploadSongCall {
  Future<ApiCallResponse> call({
    FFLocalFile? upload,
    String? song = '',
    String? artist = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Upload Song',
      apiUrl: '${FirebaseMusicManagerGroup.baseUrl}/upload',
      callType: ApiCallType.POST,
      headers: {
        ...FirebaseMusicManagerGroup.headers,
        'Authorization': 'Bearer ${jwtToken}',
        'Content-Type': 'multipart/formData',
      },
      params: {
        'upload': upload,
        'song': song,
        'artist': artist,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Firebase Music Manager Group Code

class MultipartTestEndpointCall {
  static Future<ApiCallResponse> call({
    String? artist = '',
    FFLocalFile? file,
    String? song = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Multipart Test Endpoint',
      apiUrl: 'http://192.168.254.64:8080/upload/${artist}/${song}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
