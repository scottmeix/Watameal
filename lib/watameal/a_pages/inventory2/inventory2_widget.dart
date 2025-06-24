import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/item_row_for_edit/item_row_for_edit_widget.dart';
import '/watameal/component/navigation_bar/navigation_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inventory2_model.dart';
export 'inventory2_model.dart';

class Inventory2Widget extends StatefulWidget {
  const Inventory2Widget({super.key});

  static String routeName = 'Inventory2';
  static String routePath = '/inventory2';

  @override
  State<Inventory2Widget> createState() => _Inventory2WidgetState();
}

class _Inventory2WidgetState extends State<Inventory2Widget> {
  late Inventory2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Inventory2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Inventory',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.egg_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 27.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Protein',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Meat',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels1
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keyihb_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kcarrot2,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 22.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Vegetable',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Vegetable',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels2
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keymm9_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kgrape,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 23.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Fruits',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Fruit',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels3
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keyvyr_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.knoodles,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 19.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Ready to Eat',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Ready to Eat',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels4
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keyzlm_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kgroceryBasket,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 21.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Others',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Others',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels5
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keyvex_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.ksaltPepper1,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 21.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Seasoning',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 4.0, 6.0, 0.0),
                                child: FutureBuilder<List<GetCategoryRow>>(
                                  future: SQLiteManager.instance.getCategory(
                                    category: 'Seasoning',
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetCategoryRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewGetCategoryRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 1.9),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewGetCategoryRow =
                                            listViewGetCategoryRowList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.itemRowForEditModels6
                                              .getModel(
                                            listViewGetCategoryRow.itemId
                                                .toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemRowForEditWidget(
                                            key: Key(
                                              'Keye3i_${listViewGetCategoryRow.itemId.toString()}',
                                            ),
                                            itemName:
                                                listViewGetCategoryRow.itemName,
                                            itemQuantity:
                                                listViewGetCategoryRow.count,
                                            itemUnit:
                                                listViewGetCategoryRow.unit,
                                            itemCatagory:
                                                listViewGetCategoryRow.category,
                                            itemExpiringDate:
                                                functions.stringtoDate(
                                                    listViewGetCategoryRow
                                                        .expiration!),
                                            itemFrozen: (String frozen) {
                                              return frozen == 'true';
                                            }(listViewGetCategoryRow.frozen!),
                                            itemID:
                                                listViewGetCategoryRow.itemId,
                                            inventory2View: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 25.0,
                            decoration: BoxDecoration(),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navigationBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavigationBarWidget(
                            hide: false,
                            navIconIndex: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(EditExpiringWidget.routeName);
                    },
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(),
                      child: Icon(
                        Icons.list_alt,
                        size: 26.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
