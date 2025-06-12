import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mostrar_paseos_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'principal_widget.dart' show PrincipalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class PrincipalModel extends FlutterFlowModel<PrincipalWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> perrosSeleccionados = [];
  void addToPerrosSeleccionados(DocumentReference item) =>
      perrosSeleccionados.add(item);
  void removeFromPerrosSeleccionados(DocumentReference item) =>
      perrosSeleccionados.remove(item);
  void removeAtIndexFromPerrosSeleccionados(int index) =>
      perrosSeleccionados.removeAt(index);
  void insertAtIndexInPerrosSeleccionados(int index, DocumentReference item) =>
      perrosSeleccionados.insert(index, item);
  void updatePerrosSeleccionadosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      perrosSeleccionados[index] = updateFn(perrosSeleccionados[index]);

  LatLng? mapCenter;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for HoraInicio widget.
  FocusNode? horaInicioFocusNode;
  TextEditingController? horaInicioTextController;
  String? Function(BuildContext, String?)? horaInicioTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for HoraFin widget.
  FocusNode? horaFinFocusNode;
  TextEditingController? horaFinTextController;
  String? Function(BuildContext, String?)? horaFinTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for FechaNuevoPaseo widget.
  FocusNode? fechaNuevoPaseoFocusNode;
  TextEditingController? fechaNuevoPaseoTextController;
  String? Function(BuildContext, String?)?
      fechaNuevoPaseoTextControllerValidator;
  String? _fechaNuevoPaseoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b7o4k4we' /* Selecciona el día */,
      );
    }

    return null;
  }

  DateTime? datePicked3;
  // State field(s) for HoraInicioNuevo widget.
  FocusNode? horaInicioNuevoFocusNode;
  TextEditingController? horaInicioNuevoTextController;
  String? Function(BuildContext, String?)?
      horaInicioNuevoTextControllerValidator;
  String? _horaInicioNuevoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u3umbz4c' /* Selecciona hora de inicio */,
      );
    }

    return null;
  }

  DateTime? datePicked4;
  // State field(s) for HoraFinNuevo widget.
  FocusNode? horaFinNuevoFocusNode;
  TextEditingController? horaFinNuevoTextController;
  String? Function(BuildContext, String?)? horaFinNuevoTextControllerValidator;
  String? _horaFinNuevoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fx029iw9' /* Selecciona hora de fin */,
      );
    }

    return null;
  }

  DateTime? datePicked5;
  // State field(s) for Detalles_Paseo widget.
  FocusNode? detallesPaseoFocusNode;
  TextEditingController? detallesPaseoTextController;
  String? Function(BuildContext, String?)? detallesPaseoTextControllerValidator;
  // State field(s) for Checkbox widget.
  Map<PerrosRecord, bool> checkboxValueMap2 = {};
  List<PerrosRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    fechaNuevoPaseoTextControllerValidator =
        _fechaNuevoPaseoTextControllerValidator;
    horaInicioNuevoTextControllerValidator =
        _horaInicioNuevoTextControllerValidator;
    horaFinNuevoTextControllerValidator = _horaFinNuevoTextControllerValidator;
  }

  @override
  void dispose() {
    horaInicioFocusNode?.dispose();
    horaInicioTextController?.dispose();

    horaFinFocusNode?.dispose();
    horaFinTextController?.dispose();

    fechaNuevoPaseoFocusNode?.dispose();
    fechaNuevoPaseoTextController?.dispose();

    horaInicioNuevoFocusNode?.dispose();
    horaInicioNuevoTextController?.dispose();

    horaFinNuevoFocusNode?.dispose();
    horaFinNuevoTextController?.dispose();

    detallesPaseoFocusNode?.dispose();
    detallesPaseoTextController?.dispose();
  }
}
