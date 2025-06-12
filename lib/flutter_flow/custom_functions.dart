import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime mergeDateAndTime(
  DateTime date,
  DateTime time,
) {
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

String? calcularEdad(DateTime? fechaNacimiento) {
  if (fechaNacimiento == null) return null;

  final today = DateTime.now();
  int agnos = today.year - fechaNacimiento.year;
  int meses = today.month - fechaNacimiento.month;

  if (meses < 0) {
    agnos--;
    meses += 12;
  }

  if (agnos < 1) {
    return '$meses meses';
  } else {
    return '$agnos años y $meses meses';
  }
}

String coordenadasToText(LatLng? coordenadas) {
  if (coordenadas == null) return 'Sin ubicación seleccionada';
  return '${coordenadas.latitude.toStringAsFixed(5)}, ${coordenadas.longitude.toStringAsFixed(5)}';
}

String listaNombresToString(List<String> nombres) {
  return nombres.join(', ');
}
