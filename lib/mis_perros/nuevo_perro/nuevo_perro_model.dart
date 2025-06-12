import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'nuevo_perro_widget.dart' show NuevoPerroWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NuevoPerroModel extends FlutterFlowModel<NuevoPerroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDogPictureNew = false;
  FFUploadedFile uploadedLocalFile_uploadDogPictureNew =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDogPictureNew = '';

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bjxfg3k6' /* Es obligatorio poner un nombre */,
      );
    }

    return null;
  }

  // State field(s) for Raza widget.
  FocusNode? razaFocusNode;
  TextEditingController? razaTextController;
  String? Function(BuildContext, String?)? razaTextControllerValidator;
  String? _razaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4spdztp6' /* Es obligatorio indicar una raz... */,
      );
    }

    return null;
  }

  // State field(s) for Sexo widget.
  String? sexoValue;
  FormFieldController<String>? sexoValueController;
  // State field(s) for fechaNacimiento widget.
  FocusNode? fechaNacimientoFocusNode;
  TextEditingController? fechaNacimientoTextController;
  late MaskTextInputFormatter fechaNacimientoMask;
  String? Function(BuildContext, String?)?
      fechaNacimientoTextControllerValidator;
  String? _fechaNacimientoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e2gkn9ca' /* Indica una fecha de nacimiento */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for Color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  String? _colorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rxwwqu8f' /* Introduce color del perro */,
      );
    }

    return null;
  }

  // State field(s) for Peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  late MaskTextInputFormatter pesoMask;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  String? _pesoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v652kg9h' /* Introduce peso */,
      );
    }

    return null;
  }

  // State field(s) for Caracter widget.
  FocusNode? caracterFocusNode;
  TextEditingController? caracterTextController;
  String? Function(BuildContext, String?)? caracterTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in GuardarBtn widget.
  PerrosRecord? nuevoPerro;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    razaTextControllerValidator = _razaTextControllerValidator;
    fechaNacimientoTextControllerValidator =
        _fechaNacimientoTextControllerValidator;
    colorTextControllerValidator = _colorTextControllerValidator;
    pesoTextControllerValidator = _pesoTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    razaFocusNode?.dispose();
    razaTextController?.dispose();

    fechaNacimientoFocusNode?.dispose();
    fechaNacimientoTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    caracterFocusNode?.dispose();
    caracterTextController?.dispose();
  }
}
