import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/home_tab_bar/home_tab_bar_widget.dart';
import '/watameal/component/navigation_bar/navigation_bar_widget.dart';
import 'dart:ui';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeTabBar component.
  late HomeTabBarModel homeTabBarModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    homeTabBarModel = createModel(context, () => HomeTabBarModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    homeTabBarModel.dispose();
    navigationBarModel.dispose();
  }
}
