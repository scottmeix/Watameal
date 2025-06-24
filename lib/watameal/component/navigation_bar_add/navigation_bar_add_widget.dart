import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_add_model.dart';
export 'navigation_bar_add_model.dart';

class NavigationBarAddWidget extends StatefulWidget {
  const NavigationBarAddWidget({super.key});

  @override
  State<NavigationBarAddWidget> createState() => _NavigationBarAddWidgetState();
}

class _NavigationBarAddWidgetState extends State<NavigationBarAddWidget> {
  late NavigationBarAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarAddModel());
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
        width: 45.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
        ),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 28.0,
        ),
      ),
    );
  }
}
