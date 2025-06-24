import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_chip_model.dart';
export 'search_chip_model.dart';

class SearchChipWidget extends StatefulWidget {
  const SearchChipWidget({
    super.key,
    required this.id,
    String? text,
    required this.idEnv,
  }) : this.text = text ?? 'Breakfast';

  final int? id;
  final String text;
  final int? idEnv;

  @override
  State<SearchChipWidget> createState() => _SearchChipWidgetState();
}

class _SearchChipWidgetState extends State<SearchChipWidget> {
  late SearchChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget!.id == widget!.idEnv) {
          return Container(
            width: 82.0,
            height: 37.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).selectorFill,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primaryText,
                width: 2.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget!.text,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.figtree(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
              ),
            ),
          );
        } else {
          return Container(
            width: 82.0,
            height: 37.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).divider,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget!.text,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.figtree(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}
