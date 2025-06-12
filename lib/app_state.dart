import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _busqueda = false;
  bool get busqueda => _busqueda;
  set busqueda(bool value) {
    _busqueda = value;
  }

  bool _isOwnDog = false;
  bool get isOwnDog => _isOwnDog;
  set isOwnDog(bool value) {
    _isOwnDog = value;
  }

  LatLng? _nuevaUbicacion;
  LatLng? get nuevaUbicacion => _nuevaUbicacion;
  set nuevaUbicacion(LatLng? value) {
    _nuevaUbicacion = value;
  }

  String _perroEscaneadoString = '';
  String get perroEscaneadoString => _perroEscaneadoString;
  set perroEscaneadoString(String value) {
    _perroEscaneadoString = value;
  }
}
