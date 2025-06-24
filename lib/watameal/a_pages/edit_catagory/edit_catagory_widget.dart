import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/item_row_for_edit/item_row_for_edit_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_catagory_model.dart';
export 'edit_catagory_model.dart';

class EditCatagoryWidget extends StatefulWidget {
  const EditCatagoryWidget({
    super.key,
    required this.catagoryName,
  });

  final String? catagoryName;

  static String routeName = 'EditCatagory';
  static String routePath = '/editCatagory';

  @override
  State<EditCatagoryWidget> createState() => _EditCatagoryWidgetState();
}

class _EditCatagoryWidgetState extends State<EditCatagoryWidget> {
  late EditCatagoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCatagoryModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 25.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Edit ${widget!.catagoryName}',
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.figtree(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 6.0, 0.0),
                    child: FutureBuilder<List<GetCategoryRow>>(
                      future: SQLiteManager.instance.getCategory(
                        category: widget!.catagoryName,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final listViewGetCategoryRowList = snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewGetCategoryRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 1.9),
                          itemBuilder: (context, listViewIndex) {
                            final listViewGetCategoryRow =
                                listViewGetCategoryRowList[listViewIndex];
                            return wrapWithModel(
                              model: _model.itemRowForEditModels.getModel(
                                listViewGetCategoryRow.itemId.toString(),
                                listViewIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ItemRowForEditWidget(
                                key: Key(
                                  'Key4vy_${listViewGetCategoryRow.itemId.toString()}',
                                ),
                                itemName: listViewGetCategoryRow.itemName,
                                itemQuantity: listViewGetCategoryRow.count,
                                itemUnit: listViewGetCategoryRow.unit,
                                itemCatagory: listViewGetCategoryRow.category,
                                itemExpiringDate: functions.stringtoDate(
                                    listViewGetCategoryRow.expiration!),
                                itemFrozen: (String frozen) {
                                  return frozen == 'true';
                                }(listViewGetCategoryRow.frozen!),
                                itemID: listViewGetCategoryRow.itemId,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 25.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
