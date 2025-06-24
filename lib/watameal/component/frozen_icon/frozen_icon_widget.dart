import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'frozen_icon_model.dart';
export 'frozen_icon_model.dart';

class FrozenIconWidget extends StatefulWidget {
  const FrozenIconWidget({
    super.key,
    bool? frozenParam,
    bool? itemAdd,
    required this.itemID,
  })  : this.frozenParam = frozenParam ?? false,
        this.itemAdd = itemAdd ?? false;

  final bool frozenParam;
  final bool itemAdd;
  final int? itemID;

  @override
  State<FrozenIconWidget> createState() => _FrozenIconWidgetState();
}

class _FrozenIconWidgetState extends State<FrozenIconWidget> {
  late FrozenIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrozenIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.frozenStateChild = widget!.frozenParam;
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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.frozenStateChild = !(_model.frozenStateChild ?? true);
          safeSetState(() {});
          if (!(widget!.itemAdd != null)) {
            await SQLiteManager.instance.updateFrozen(
              frozen: _model.frozenStateChild!,
              itemid: widget!.itemID!,
            );
          }
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (_model.frozenStateChild ?? false) {
                return Icon(
                  Icons.toggle_on_rounded,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 24.0,
                );
              } else {
                return Icon(
                  Icons.toggle_off_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
