import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/mis_perros/mi_q_r/mi_q_r_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'perfil_perro_widget.dart' show PerfilPerroWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PerfilPerroModel extends FlutterFlowModel<PerfilPerroWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDogPictureEdit = false;
  FFUploadedFile uploadedLocalFile_uploadDogPictureEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDogPictureEdit = '';

  // State field(s) for Peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  late MaskTextInputFormatter pesoMask;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
