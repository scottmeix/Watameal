import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/home_tab_bar_chip/home_tab_bar_chip_widget.dart';
import '/watameal/component/home_tab_content_chip/home_tab_content_chip_widget.dart';
import '/watameal/component/home_tab_content_chip_init/home_tab_content_chip_init_widget.dart';
import 'dart:ui';
import 'home_tab_bar_widget.dart' show HomeTabBarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTabBarModel extends FlutterFlowModel<HomeTabBarWidget> {
  ///  Local state fields for this component.

  int tabID = 0;

  ///  State fields for stateful widgets in this component.

  // Model for HomeTabBarChip component.
  late HomeTabBarChipModel homeTabBarChipModel1;
  // Model for HomeTabBarChip component.
  late HomeTabBarChipModel homeTabBarChipModel2;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel1;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel2;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel3;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel4;
  // Model for HomeTabContentChipInit component.
  late HomeTabContentChipInitModel homeTabContentChipInitModel1;
  // Model for HomeTabContentChipInit component.
  late HomeTabContentChipInitModel homeTabContentChipInitModel2;
  // Model for HomeTabContentChipInit component.
  late HomeTabContentChipInitModel homeTabContentChipInitModel3;
  // Model for HomeTabContentChipInit component.
  late HomeTabContentChipInitModel homeTabContentChipInitModel4;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel5;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel6;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel7;
  // Model for HomeTabContentChip component.
  late HomeTabContentChipModel homeTabContentChipModel8;
  // Models for HomeTabContentChip dynamic component.
  late FlutterFlowDynamicModels<HomeTabContentChipModel>
      homeTabContentChipModels9;

  @override
  void initState(BuildContext context) {
    homeTabBarChipModel1 = createModel(context, () => HomeTabBarChipModel());
    homeTabBarChipModel2 = createModel(context, () => HomeTabBarChipModel());
    homeTabContentChipModel1 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel2 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel3 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel4 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipInitModel1 =
        createModel(context, () => HomeTabContentChipInitModel());
    homeTabContentChipInitModel2 =
        createModel(context, () => HomeTabContentChipInitModel());
    homeTabContentChipInitModel3 =
        createModel(context, () => HomeTabContentChipInitModel());
    homeTabContentChipInitModel4 =
        createModel(context, () => HomeTabContentChipInitModel());
    homeTabContentChipModel5 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel6 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel7 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModel8 =
        createModel(context, () => HomeTabContentChipModel());
    homeTabContentChipModels9 =
        FlutterFlowDynamicModels(() => HomeTabContentChipModel());
  }

  @override
  void dispose() {
    homeTabBarChipModel1.dispose();
    homeTabBarChipModel2.dispose();
    homeTabContentChipModel1.dispose();
    homeTabContentChipModel2.dispose();
    homeTabContentChipModel3.dispose();
    homeTabContentChipModel4.dispose();
    homeTabContentChipInitModel1.dispose();
    homeTabContentChipInitModel2.dispose();
    homeTabContentChipInitModel3.dispose();
    homeTabContentChipInitModel4.dispose();
    homeTabContentChipModel5.dispose();
    homeTabContentChipModel6.dispose();
    homeTabContentChipModel7.dispose();
    homeTabContentChipModel8.dispose();
    homeTabContentChipModels9.dispose();
  }
}
