import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'upload_media_widget.dart' show UploadMediaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UploadMediaModel extends FlutterFlowModel<UploadMediaWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadedImage;

  bool scanning = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkAndUpdateApiUsageLimit] action in Icon widget.
  bool? hasCredit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future imageUpload(
    BuildContext context, {
    required bool? camera,
  }) async {
    FFUploadedFile? pickedImage;

    pickedImage = await actions.pickImage(
      camera!,
    );
    if (pickedImage != null && (pickedImage?.bytes?.isNotEmpty ?? false)) {
      uploadedImage = pickedImage;
    }
  }
}
