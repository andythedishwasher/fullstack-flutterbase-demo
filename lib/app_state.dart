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

  bool _songUploaded = false;
  bool get songUploaded => _songUploaded;
  set songUploaded(bool _value) {
    _songUploaded = _value;
  }

  String _uploadedUrl = '';
  String get uploadedUrl => _uploadedUrl;
  set uploadedUrl(String _value) {
    _uploadedUrl = _value;
  }

  List<String> _sampleUrls = [];
  List<String> get sampleUrls => _sampleUrls;
  set sampleUrls(List<String> _value) {
    _sampleUrls = _value;
  }

  void addToSampleUrls(String _value) {
    _sampleUrls.add(_value);
  }

  void removeFromSampleUrls(String _value) {
    _sampleUrls.remove(_value);
  }

  List<String> _sampleArtists = [];
  List<String> get sampleArtists => _sampleArtists;
  set sampleArtists(List<String> _value) {
    _sampleArtists = _value;
  }

  void addToSampleArtists(String _value) {
    _sampleArtists.add(_value);
  }

  void removeFromSampleArtists(String _value) {
    _sampleArtists.remove(_value);
  }

  List<String> _sampleTitles = [];
  List<String> get sampleTitles => _sampleTitles;
  set sampleTitles(List<String> _value) {
    _sampleTitles = _value;
  }

  void addToSampleTitles(String _value) {
    _sampleTitles.add(_value);
  }

  void removeFromSampleTitles(String _value) {
    _sampleTitles.remove(_value);
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
