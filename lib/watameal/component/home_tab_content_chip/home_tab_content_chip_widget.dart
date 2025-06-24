import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_tab_content_chip_model.dart';
export 'home_tab_content_chip_model.dart';

class HomeTabContentChipWidget extends StatefulWidget {
  const HomeTabContentChipWidget({
    super.key,
    required this.index,
    bool? likedParam,
  }) : this.likedParam = likedParam ?? false;

  final int? index;
  final bool likedParam;

  @override
  State<HomeTabContentChipWidget> createState() =>
      _HomeTabContentChipWidgetState();
}

class _HomeTabContentChipWidgetState extends State<HomeTabContentChipWidget> {
  late HomeTabContentChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeTabContentChipModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.liked = widget!.likedParam;
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
          context.pushNamed(
            DishDetailsWidget.routeName,
            queryParameters: {
              'index': serializeParam(
                widget!.index,
                ParamType.int,
              ),
              'likedParam': serializeParam(
                widget!.likedParam,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: 190.0,
          height: 360.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                    tag: FFAppState()
                        .DishLocal
                        .elementAtOrNull(widget!.index!)!
                        .image,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 0),
                        fadeOutDuration: Duration(milliseconds: 0),
                        imageUrl: FFAppState()
                            .DishLocal
                            .elementAtOrNull(widget!.index!)!
                            .image,
                        width: 300.0,
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 0.0, 0.0),
                      child: Container(
                        width: 150.0,
                        height: 35.0,
                        decoration: BoxDecoration(),
                        child: Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .DishLocal
                                .elementAtOrNull(widget!.index!)
                                ?.dishName,
                            'A Default Dish',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 6.0),
                  child: Text(
                    '${valueOrDefault<String>(
                      FFAppState()
                          .DishLocal
                          .elementAtOrNull(widget!.index!)
                          ?.cookingTime
                          ?.toString(),
                      '15',
                    )} min',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
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
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 33.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.liked = !_model.liked;
                      FFAppState().updateDishLocalAtIndex(
                        widget!.index!,
                        (e) => e..liked = _model.liked,
                      );
                      if (_model.liked == true) {
                        await SQLiteManager.instance.setLikedEntry(
                          variableindex: widget!.index!,
                        );
                      } else {
                        await SQLiteManager.instance.removeLikedEntry(
                          variableindex: widget!.index!,
                        );
                      }

                      _model.updatePage(() {});
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          if (widget!.likedParam) {
                            return Icon(
                              Icons.favorite_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            );
                          } else {
                            return Icon(
                              Icons.favorite_border_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 22.0,
                            );
                          }
                        },
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
