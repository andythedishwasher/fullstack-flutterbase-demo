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
  static UploadSongCall uploadSongCall = UploadSongCall();
  static ClaimSampleCall claimSampleCall = ClaimSampleCall();
  static GetAllSamplesCall getAllSamplesCall = GetAllSamplesCall();
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
      apiUrl: '${FirebaseMusicManagerGroup.baseUrl}/upload/${artist}/${song}',
      callType: ApiCallType.POST,
      headers: {
        ...FirebaseMusicManagerGroup.headers,
        'Content-Type': 'multipart/formData',
        'Authorization': 'Bearer ${jwtToken}',
      },
      params: {
        'file': upload,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic downloadUrl(dynamic response) => getJsonField(
        response,
        r'''$.url[0]''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error[0]''',
      );
}

class ClaimSampleCall {
  Future<ApiCallResponse> call({
    String? claimant = '',
    String? artist = '',
    String? song = '',
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Claim Sample',
      apiUrl:
          '${FirebaseMusicManagerGroup.baseUrl}/claim/${claimant}/${artist}/${song}',
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

  dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class GetAllSamplesCall {
  Future<ApiCallResponse> call({
    String? jwtToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Samples',
      apiUrl: '${FirebaseMusicManagerGroup.baseUrl}/samples',
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

  dynamic urls(dynamic response) => getJsonField(
        response,
        r'''$.urls''',
        true,
      );
  dynamic urlError(dynamic response) => getJsonField(
        response,
        r'''$.urlError''',
      );
  dynamic metadataError(dynamic response) => getJsonField(
        response,
        r'''$.metadataError''',
      );
  dynamic artists(dynamic response) => getJsonField(
        response,
        r'''$.artists''',
        true,
      );
  dynamic titles(dynamic response) => getJsonField(
        response,
        r'''$.titles''',
        true,
      );
}

/// End Firebase Music Manager Group Code

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
