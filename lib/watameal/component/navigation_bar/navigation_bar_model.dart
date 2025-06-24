import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/navigation_bar_add/navigation_bar_add_widget.dart';
import '/watameal/component/navigation_bar_icon/navigation_bar_icon_widget.dart';
import '/watameal/component/upload_options/upload_options_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'navigation_bar_widget.dart' show NavigationBarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavigationBarModel extends FlutterFlowModel<NavigationBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CookIcon.
  late NavigationBarIconModel cookIconModel;
  // Model for NavigationBarAdd component.
  late NavigationBarAddModel navigationBarAddModel;
  // Model for InventoryIcon.
  late NavigationBarIconModel inventoryIconModel;

  @override
  void initState(BuildContext context) {
    cookIconModel = createModel(context, () => NavigationBarIconModel());
    navigationBarAddModel = createModel(context, () => NavigationBarAddModel());
    inventoryIconModel = createModel(context, () => NavigationBarIconModel());
  }

  @override
  void dispose() {
    cookIconModel.dispose();
    navigationBarAddModel.dispose();
    inventoryIconModel.dispose();
  }
}
