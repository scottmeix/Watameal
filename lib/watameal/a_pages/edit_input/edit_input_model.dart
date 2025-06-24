import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/item_add/item_add_widget.dart';
import '/watameal/component/item_row_for_edit/item_row_for_edit_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_input_widget.dart' show EditInputWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditInputModel extends FlutterFlowModel<EditInputWidget> {
  ///  Local state fields for this page.

  bool temp = false;

  int? itemCountState = 0;

  ///  State fields for stateful widgets in this page.

  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels;

  @override
  void initState(BuildContext context) {
    itemRowForEditModels =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
  }

  @override
  void dispose() {
    itemRowForEditModels.dispose();
  }
}
