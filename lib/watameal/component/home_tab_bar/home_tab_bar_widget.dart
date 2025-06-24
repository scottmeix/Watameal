import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/home_tab_bar_chip/home_tab_bar_chip_widget.dart';
import '/watameal/component/home_tab_content_chip/home_tab_content_chip_widget.dart';
import '/watameal/component/home_tab_content_chip_init/home_tab_content_chip_init_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_tab_bar_model.dart';
export 'home_tab_bar_model.dart';

class HomeTabBarWidget extends StatefulWidget {
  const HomeTabBarWidget({super.key});

  @override
  State<HomeTabBarWidget> createState() => _HomeTabBarWidgetState();
}

class _HomeTabBarWidgetState extends State<HomeTabBarWidget> {
  late HomeTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeTabBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 43.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.tabID = 0;
                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.homeTabBarChipModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: HomeTabBarChipWidget(
                      selected: _model.tabID == 0,
                      text: 'Explore',
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.tabID = 1;
                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.homeTabBarChipModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: HomeTabBarChipWidget(
                      selected: _model.tabID == 1,
                      text: 'Liked',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).divider,
            ),
          ),
          Flexible(
            child: Builder(
              builder: (context) {
                if (_model.tabID == 2) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            wrapWithModel(
                              model: _model.homeTabContentChipModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: HomeTabContentChipWidget(
                                index: FFAppState()
                                    .DishLocalIndexes
                                    .elementAtOrNull(0)!,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.homeTabContentChipModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: HomeTabContentChipWidget(
                                index: FFAppState()
                                    .DishLocalIndexes
                                    .elementAtOrNull(1)!,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            wrapWithModel(
                              model: _model.homeTabContentChipModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: HomeTabContentChipWidget(
                                index: FFAppState()
                                    .DishLocalIndexes
                                    .elementAtOrNull(2)!,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.homeTabContentChipModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: HomeTabContentChipWidget(
                                index: FFAppState()
                                    .DishLocalIndexes
                                    .elementAtOrNull(3)!,
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  );
                } else if (_model.tabID == 0) {
                  return Builder(
                    builder: (context) {
                      if (FFAppState().FirstLaunch) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    wrapWithModel(
                                      model:
                                          _model.homeTabContentChipInitModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipInitWidget(
                                        index: FFAppState()
                                            .InitDishLocalIndexes
                                            .elementAtOrNull(0)!,
                                        likedParam: true,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model:
                                          _model.homeTabContentChipInitModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipInitWidget(
                                        index: FFAppState()
                                            .InitDishLocalIndexes
                                            .elementAtOrNull(1)!,
                                        likedParam: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    wrapWithModel(
                                      model:
                                          _model.homeTabContentChipInitModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipInitWidget(
                                        index: FFAppState()
                                            .InitDishLocalIndexes
                                            .elementAtOrNull(2)!,
                                        likedParam: true,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model:
                                          _model.homeTabContentChipInitModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipInitWidget(
                                        index: FFAppState()
                                            .InitDishLocalIndexes
                                            .elementAtOrNull(3)!,
                                        likedParam: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    wrapWithModel(
                                      model: _model.homeTabContentChipModel5,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipWidget(
                                        index: FFAppState()
                                            .DishLocalIndexes
                                            .elementAtOrNull(0)!,
                                        likedParam: FFAppState()
                                            .DishLocal
                                            .elementAtOrNull(FFAppState()
                                                .DishLocalIndexes
                                                .elementAtOrNull(0)!)!
                                            .liked,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.homeTabContentChipModel6,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipWidget(
                                        index: FFAppState()
                                            .DishLocalIndexes
                                            .elementAtOrNull(1)!,
                                        likedParam: FFAppState()
                                            .DishLocal
                                            .elementAtOrNull(FFAppState()
                                                .DishLocalIndexes
                                                .elementAtOrNull(1)!)!
                                            .liked,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    wrapWithModel(
                                      model: _model.homeTabContentChipModel7,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipWidget(
                                        index: FFAppState()
                                            .DishLocalIndexes
                                            .elementAtOrNull(2)!,
                                        likedParam: FFAppState()
                                            .DishLocal
                                            .elementAtOrNull(FFAppState()
                                                .DishLocalIndexes
                                                .elementAtOrNull(2)!)!
                                            .liked,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.homeTabContentChipModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: HomeTabContentChipWidget(
                                        index: FFAppState()
                                            .DishLocalIndexes
                                            .elementAtOrNull(3)!,
                                        likedParam: FFAppState()
                                            .DishLocal
                                            .elementAtOrNull(FFAppState()
                                                .DishLocalIndexes
                                                .elementAtOrNull(3)!)!
                                            .liked,
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        );
                      }
                    },
                  );
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: FutureBuilder<List<FetchLikedRow>>(
                      future: SQLiteManager.instance.fetchLiked(),
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
                        final likedDishesFetchLikedRowList = snapshot.data!;

                        return MasonryGridView.builder(
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          mainAxisSpacing: 5.0,
                          itemCount: likedDishesFetchLikedRowList.length,
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            25.0,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, likedDishesIndex) {
                            final likedDishesFetchLikedRow =
                                likedDishesFetchLikedRowList[likedDishesIndex];
                            return Visibility(
                              visible: FFAppState().DishLocal.elementAtOrNull(
                                      likedDishesFetchLikedRow
                                          .dishLocalIndex) !=
                                  null,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model:
                                      _model.homeTabContentChipModels9.getModel(
                                    likedDishesIndex.toString(),
                                    likedDishesIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: HomeTabContentChipWidget(
                                    key: Key(
                                      'Key65m_${likedDishesIndex.toString()}',
                                    ),
                                    index:
                                        likedDishesFetchLikedRow.dishLocalIndex,
                                    likedParam: FFAppState()
                                        .DishLocal
                                        .elementAtOrNull(
                                            likedDishesFetchLikedRow
                                                .dishLocalIndex)!
                                        .liked,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
