import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/inventory_card/inventory_card_widget.dart';
import '/watameal/component/navigation_bar/navigation_bar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'inventory_widget.dart' show InventoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InventoryModel extends FlutterFlowModel<InventoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel1;
  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel2;
  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel3;
  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel4;
  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel5;
  // Model for InventoryCard component.
  late InventoryCardModel inventoryCardModel6;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    inventoryCardModel1 = createModel(context, () => InventoryCardModel());
    inventoryCardModel2 = createModel(context, () => InventoryCardModel());
    inventoryCardModel3 = createModel(context, () => InventoryCardModel());
    inventoryCardModel4 = createModel(context, () => InventoryCardModel());
    inventoryCardModel5 = createModel(context, () => InventoryCardModel());
    inventoryCardModel6 = createModel(context, () => InventoryCardModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    inventoryCardModel1.dispose();
    inventoryCardModel2.dispose();
    inventoryCardModel3.dispose();
    inventoryCardModel4.dispose();
    inventoryCardModel5.dispose();
    inventoryCardModel6.dispose();
    navigationBarModel.dispose();
  }
}
