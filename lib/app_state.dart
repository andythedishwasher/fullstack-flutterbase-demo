import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _songFound = false;
  bool get songFound => _songFound;
  set songFound(bool _value) {
    _songFound = _value;
  }

  String _songUrl = '';
  String get songUrl => _songUrl;
  set songUrl(String _value) {
    _songUrl = _value;
  }

  dynamic _uploadedFile = jsonDecode('{\"name\":\"\",\"bytes\":[]}');
  dynamic get uploadedFile => _uploadedFile;
  set uploadedFile(dynamic _value) {
    _uploadedFile = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
