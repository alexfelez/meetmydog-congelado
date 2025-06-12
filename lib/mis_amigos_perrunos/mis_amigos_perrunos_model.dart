import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'mis_amigos_perrunos_widget.dart' show MisAmigosPerrunosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MisAmigosPerrunosModel extends FlutterFlowModel<MisAmigosPerrunosWidget> {
  ///  State fields for stateful widgets in this page.

  var perroEscaneado = '';
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<PerrosRecord>? perroEscaneadoId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
