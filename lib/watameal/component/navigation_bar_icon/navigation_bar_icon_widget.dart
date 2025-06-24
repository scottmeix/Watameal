import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_icon_model.dart';
export 'navigation_bar_icon_model.dart';

class NavigationBarIconWidget extends StatefulWidget {
  const NavigationBarIconWidget({
    super.key,
    bool? selected,
    required this.iconSelected,
    required this.iconDefault,
    required this.iconText,
  }) : this.selected = selected ?? false;

  final bool selected;
  final Widget? iconSelected;
  final Widget? iconDefault;
  final String? iconText;

  @override
  State<NavigationBarIconWidget> createState() =>
      _NavigationBarIconWidgetState();
}

class _NavigationBarIconWidgetState extends State<NavigationBarIconWidget> {
  late NavigationBarIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarIconModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if (widget!.selected) {
                return widget!.iconSelected!;
              } else {
                return widget!.iconDefault!;
              }
            },
          ),
          Text(
            valueOrDefault<String>(
              widget!.iconText,
              'icontext',
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  font: GoogleFonts.figtree(
                    fontWeight:
                        FlutterFlowTheme.of(context).displaySmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).displaySmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).displaySmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).displaySmall.fontStyle,
                ),
          ),
        ].divide(SizedBox(height: 1.0)),
      ),
    );
  }
}
