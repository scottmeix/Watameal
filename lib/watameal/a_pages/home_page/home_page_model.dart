import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/home_tab_bar/home_tab_bar_widget.dart';
import '/watameal/component/navigation_bar/navigation_bar_widget.dart';
import '/watameal/component/search_chip/search_chip_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int indexMealType = 0;

  int indexCookTime = 0;

  int indexMealContent = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for HomeTabBar component.
  late HomeTabBarModel homeTabBarModel;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel1;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel2;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel3;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel4;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel5;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel6;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel7;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel8;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel9;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel10;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel11;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel12;
  // Model for SearchChip component.
  late SearchChipModel searchChipModel13;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - checkAndUpdateApiUsageLimit] action in Button widget.
  bool? hasCredit;
  // Stores action output result for [Custom Action - dishRecommendationPrompt] action in Button widget.
  bool? success;

  @override
  void initState(BuildContext context) {
    homeTabBarModel = createModel(context, () => HomeTabBarModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    searchChipModel1 = createModel(context, () => SearchChipModel());
    searchChipModel2 = createModel(context, () => SearchChipModel());
    searchChipModel3 = createModel(context, () => SearchChipModel());
    searchChipModel4 = createModel(context, () => SearchChipModel());
    searchChipModel5 = createModel(context, () => SearchChipModel());
    searchChipModel6 = createModel(context, () => SearchChipModel());
    searchChipModel7 = createModel(context, () => SearchChipModel());
    searchChipModel8 = createModel(context, () => SearchChipModel());
    searchChipModel9 = createModel(context, () => SearchChipModel());
    searchChipModel10 = createModel(context, () => SearchChipModel());
    searchChipModel11 = createModel(context, () => SearchChipModel());
    searchChipModel12 = createModel(context, () => SearchChipModel());
    searchChipModel13 = createModel(context, () => SearchChipModel());
  }

  @override
  void dispose() {
    homeTabBarModel.dispose();
    navigationBarModel.dispose();
    searchChipModel1.dispose();
    searchChipModel2.dispose();
    searchChipModel3.dispose();
    searchChipModel4.dispose();
    searchChipModel5.dispose();
    searchChipModel6.dispose();
    searchChipModel7.dispose();
    searchChipModel8.dispose();
    searchChipModel9.dispose();
    searchChipModel10.dispose();
    searchChipModel11.dispose();
    searchChipModel12.dispose();
    searchChipModel13.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
