import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'home_tab_content_chip_widget.dart' show HomeTabContentChipWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTabContentChipModel
    extends FlutterFlowModel<HomeTabContentChipWidget> {
  ///  Local state fields for this component.

  bool liked = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
