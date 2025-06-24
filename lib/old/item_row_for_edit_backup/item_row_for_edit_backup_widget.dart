import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/item_add/item_add_widget.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_row_for_edit_backup_model.dart';
export 'item_row_for_edit_backup_model.dart';

class ItemRowForEditBackupWidget extends StatefulWidget {
  const ItemRowForEditBackupWidget({
    super.key,
    String? itemName,
    this.itemQuantity,
    this.itemUnit,
    this.itemExpiringDate,
    this.itemCatagory,
    required this.itemFrozen,
    required this.itemID,
    bool? inventory2View,
  })  : this.itemName = itemName ?? 'Beef',
        this.inventory2View = inventory2View ?? false;

  final String itemName;
  final String? itemQuantity;
  final String? itemUnit;
  final DateTime? itemExpiringDate;
  final String? itemCatagory;
  final bool? itemFrozen;
  final int? itemID;
  final bool inventory2View;

  @override
  State<ItemRowForEditBackupWidget> createState() =>
      _ItemRowForEditBackupWidgetState();
}

class _ItemRowForEditBackupWidgetState
    extends State<ItemRowForEditBackupWidget> {
  late ItemRowForEditBackupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemRowForEditBackupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.frozenState = widget!.itemFrozen!;
      _model.expiringDateState = widget!.itemExpiringDate;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ItemAddWidget(
                  existingItem: true,
                  itemID: widget!.itemID,
                  itemName: widget!.itemName,
                  itemQuantity: widget!.itemQuantity,
                  itemUnit: widget!.itemUnit,
                  itemCate: widget!.itemCatagory,
                  itemExpiration: widget!.itemExpiringDate,
                  itemFrozen: widget!.itemFrozen,
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(),
                  child: Text(
                    widget!.itemName,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.figtree(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Container(
                width: 55.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    '${widget!.itemQuantity} ${widget!.itemUnit}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.figtree(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final _datePickedDate = await showDatePicker(
                    context: context,
                    initialDate: ((dateTimeFormat(
                                    "yMd", widget!.itemExpiringDate) !=
                                dateTimeFormat("yMd", FFAppState().defaultdate)
                            ? widget!.itemExpiringDate
                            : getCurrentTimestamp) ??
                        DateTime.now()),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                    builder: (context, child) {
                      return wrapInMaterialDatePickerTheme(
                        context,
                        child!,
                        headerBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        headerForegroundColor:
                            FlutterFlowTheme.of(context).info,
                        headerTextStyle:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                        pickerBackgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        pickerForegroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        selectedDateTimeBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        selectedDateTimeForegroundColor:
                            FlutterFlowTheme.of(context).info,
                        actionButtonForegroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        iconSize: 24.0,
                      );
                    },
                  );

                  if (_datePickedDate != null) {
                    safeSetState(() {
                      _model.datePicked = DateTime(
                        _datePickedDate.year,
                        _datePickedDate.month,
                        _datePickedDate.day,
                      );
                    });
                  } else if (_model.datePicked != null) {
                    safeSetState(() {
                      _model.datePicked = (dateTimeFormat(
                                  "yMd", widget!.itemExpiringDate) !=
                              dateTimeFormat("yMd", FFAppState().defaultdate)
                          ? widget!.itemExpiringDate
                          : getCurrentTimestamp);
                    });
                  }
                  if ((_model.datePicked != null) &&
                      (dateTimeFormat("yMd", _model.datePicked) !=
                          dateTimeFormat("yMd", widget!.itemExpiringDate))) {
                    await SQLiteManager.instance.setDate(
                      expiration: _model.datePicked!,
                      itemid: widget!.itemID,
                    );
                    _model.frozenState = false;
                    _model.expiringDateState = _model.datePicked;
                    safeSetState(() {});
                  }
                },
                child: Container(
                  width: 70.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (widget!.itemFrozen == true) {
                          return Text(
                            'frozen',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        } else {
                          return Text(
                            widget!.itemExpiringDate == FFAppState().defaultdate
                                ? 'm/d/y'
                                : dateTimeFormat(
                                    "yMd", widget!.itemExpiringDate),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.frozenState = !_model.frozenState;
                  await SQLiteManager.instance.updateFrozen(
                    frozen: _model.frozenState,
                    itemid: widget!.itemID!,
                  );

                  _model.updatePage(() {});
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      if (widget!.itemFrozen ?? false) {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.toggle_on,
                            color: Color(0xFF00C1FF),
                            size: 24.0,
                          ),
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.toggle_off,
                            color: Color(0xFFC1C0C0),
                            size: 24.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                width: 80.0,
                decoration: BoxDecoration(),
                child: Text(
                  valueOrDefault<String>(
                    widget!.itemCatagory,
                    'Others',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.figtree(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Container(
                width: 30.0,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget!.inventory2View == true) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('Delete item?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await SQLiteManager.instance.deleteItem(
                          itemid: widget!.itemID!,
                        );

                        _model.updatePage(() {});
                      }
                    } else {
                      await SQLiteManager.instance.deleteItem(
                        itemid: widget!.itemID!,
                      );

                      _model.updatePage(() {});
                    }
                  },
                  child: Icon(
                    Icons.delete_outline_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ].addToStart(SizedBox(width: 6.0)).addToEnd(SizedBox(width: 1.0)),
          ),
        ),
      ),
    );
  }
}
