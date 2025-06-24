import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/watameal/component/home_tab_content_chip_init/home_tab_content_chip_init_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'init_dish_local_library_model.dart';
export 'init_dish_local_library_model.dart';

class InitDishLocalLibraryWidget extends StatefulWidget {
  const InitDishLocalLibraryWidget({super.key});

  static String routeName = 'InitDishLocalLibrary';
  static String routePath = '/initDishLocalLibrary';

  @override
  State<InitDishLocalLibraryWidget> createState() =>
      _InitDishLocalLibraryWidgetState();
}

class _InitDishLocalLibraryWidgetState
    extends State<InitDishLocalLibraryWidget> {
  late InitDishLocalLibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitDishLocalLibraryModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
            'InitDishes',
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
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(
              builder: (context) {
                final initDishLocalLibraryVariable =
                    FFAppState().InitDishLocal.map((e) => e).toList();

                return MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  itemCount: initDishLocalLibraryVariable.length,
                  itemBuilder: (context, initDishLocalLibraryVariableIndex) {
                    final initDishLocalLibraryVariableItem =
                        initDishLocalLibraryVariable[
                            initDishLocalLibraryVariableIndex];
                    return HomeTabContentChipInitWidget(
                      key: Key(
                          'Keyezz_${initDishLocalLibraryVariableIndex}_of_${initDishLocalLibraryVariable.length}'),
                      index: initDishLocalLibraryVariableIndex,
                      likedParam: initDishLocalLibraryVariableItem.liked,
                      libView: true,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
