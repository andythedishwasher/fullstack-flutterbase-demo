import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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

  bool _songUploaded = false;
  bool get songUploaded => _songUploaded;
  set songUploaded(bool _value) {
    _songUploaded = _value;
  }

  String _foundUrl = '';
  String get foundUrl => _foundUrl;
  set foundUrl(String _value) {
    _foundUrl = _value;
  }

  String _uploadedUrl = '';
  String get uploadedUrl => _uploadedUrl;
  set uploadedUrl(String _value) {
    _uploadedUrl = _value;
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
