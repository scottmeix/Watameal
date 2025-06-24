import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/watameal/component/navigation_bar_add/navigation_bar_add_widget.dart';
import '/watameal/component/navigation_bar_icon/navigation_bar_icon_widget.dart';
import '/watameal/component/upload_options/upload_options_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({
    super.key,
    bool? hide,
    int? navIconIndex,
  })  : this.hide = hide ?? false,
        this.navIconIndex = navIconIndex ?? 0;

  final bool hide;
  final int navIconIndex;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        HomePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: wrapWithModel(
                      model: _model.cookIconModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavigationBarIconWidget(
                        selected: widget!.navIconIndex == 1,
                        iconSelected: Icon(
                          Icons.soup_kitchen,
                        ),
                        iconDefault: Icon(
                          Icons.soup_kitchen_outlined,
                        ),
                        iconText: 'Cook',
                      ),
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
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: UploadOptionsWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                onLongPress: () async {
                  context.pushNamed(
                    UploadMediaWidget.routeName,
                    queryParameters: {
                      'isCameraParam': serializeParam(
                        true,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                },
                child: wrapWithModel(
                  model: _model.navigationBarAddModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavigationBarAddWidget(),
                ),
              ),
              Flexible(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (FFAppState().FlatInventoryView == true) {
                      context.pushNamed(
                        Inventory2Widget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      context.pushNamed(
                        InventoryWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                  onLongPress: () async {
                    context.pushNamed(DebugPageWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.inventoryIconModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavigationBarIconWidget(
                      selected: widget!.navIconIndex == 2,
                      iconSelected: Icon(
                        Icons.kitchen,
                      ),
                      iconDefault: Icon(
                        Icons.kitchen_outlined,
                      ),
                      iconText: 'Inventory',
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
