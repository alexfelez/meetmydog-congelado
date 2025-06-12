import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login_register_settings/dark_mode/dark_mode_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'menu_settings_widget.dart' show MenuSettingsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuSettingsModel extends FlutterFlowModel<MenuSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Dark_Mode component.
  late DarkModeModel darkModeModel;

  @override
  void initState(BuildContext context) {
    darkModeModel = createModel(context, () => DarkModeModel());
  }

  @override
  void dispose() {
    darkModeModel.dispose();
  }
}
