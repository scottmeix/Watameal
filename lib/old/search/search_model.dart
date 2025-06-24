import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/search_chip/search_chip_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  int indexMealType = 0;

  int indexCookTime = 0;

  int indexMealContent = 0;

  String instructions = 'instruction for cooking';

  bool loading = false;

  ///  State fields for stateful widgets in this page.

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

  @override
  void initState(BuildContext context) {
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
