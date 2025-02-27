import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _onboardFinalValue = 3;
  int get onboardFinalValue => _onboardFinalValue;
  set onboardFinalValue(int value) {
    _onboardFinalValue = value;
  }

  int _onboardingPageScrolled = 1;
  int get onboardingPageScrolled => _onboardingPageScrolled;
  set onboardingPageScrolled(int value) {
    _onboardingPageScrolled = value;
  }

  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;
  set isFavourite(bool value) {
    _isFavourite = value;
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
