import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_tab_bar_chip_model.dart';
export 'home_tab_bar_chip_model.dart';

class HomeTabBarChipWidget extends StatefulWidget {
  const HomeTabBarChipWidget({
    super.key,
    bool? selected,
    required this.text,
  }) : this.selected = selected ?? true;

  final bool selected;
  final String? text;

  @override
  State<HomeTabBarChipWidget> createState() => _HomeTabBarChipWidgetState();
}

class _HomeTabBarChipWidgetState extends State<HomeTabBarChipWidget> {
  late HomeTabBarChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeTabBarChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 80.0,
        height: 42.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.text,
                  'text',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.figtree(
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: widget!.selected
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).unselectedHeadline,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              if (widget!.selected)
                Container(
                  width: 30.0,
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
            ].divide(SizedBox(height: 4.0)).addToStart(SizedBox(height: 13.0)),
          ),
        ),
      ),
    );
  }
}
