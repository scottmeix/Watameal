import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/item_add/item_add_widget.dart';
import 'dart:ui';
import 'item_row_for_edit_backup_widget.dart' show ItemRowForEditBackupWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemRowForEditBackupModel
    extends FlutterFlowModel<ItemRowForEditBackupWidget> {
  ///  Local state fields for this component.

  bool frozenState = false;

  bool editItem = false;

  DateTime? expiringDateState;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
