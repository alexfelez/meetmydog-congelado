import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'buscar_perros_widget.dart' show BuscarPerrosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class BuscarPerrosModel extends FlutterFlowModel<BuscarPerrosWidget> {
  ///  Local state fields for this page.

  String? busquedaNombre2 = '\"\"';

  ///  State fields for stateful widgets in this page.

  // State field(s) for BucadorPerros widget.
  FocusNode? bucadorPerrosFocusNode;
  TextEditingController? bucadorPerrosTextController;
  String? Function(BuildContext, String?)? bucadorPerrosTextControllerValidator;
  List<PerrosRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bucadorPerrosFocusNode?.dispose();
    bucadorPerrosTextController?.dispose();
  }
}
