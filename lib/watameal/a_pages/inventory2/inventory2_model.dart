import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/item_row_for_edit/item_row_for_edit_widget.dart';
import '/watameal/component/navigation_bar/navigation_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'inventory2_widget.dart' show Inventory2Widget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Inventory2Model extends FlutterFlowModel<Inventory2Widget> {
  ///  Local state fields for this page.

  bool temp = false;

  ///  State fields for stateful widgets in this page.

  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels1;
  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels2;
  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels3;
  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels4;
  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels5;
  // Models for ItemRowForEdit dynamic component.
  late FlutterFlowDynamicModels<ItemRowForEditModel> itemRowForEditModels6;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    itemRowForEditModels1 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    itemRowForEditModels2 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    itemRowForEditModels3 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    itemRowForEditModels4 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    itemRowForEditModels5 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    itemRowForEditModels6 =
        FlutterFlowDynamicModels(() => ItemRowForEditModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    itemRowForEditModels1.dispose();
    itemRowForEditModels2.dispose();
    itemRowForEditModels3.dispose();
    itemRowForEditModels4.dispose();
    itemRowForEditModels5.dispose();
    itemRowForEditModels6.dispose();
    navigationBarModel.dispose();
  }
}
