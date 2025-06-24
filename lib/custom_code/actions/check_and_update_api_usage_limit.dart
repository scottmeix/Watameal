// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> checkAndUpdateApiUsageLimit(String? apiName) async {
  // Add your function code here!
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  // Dishgen logic
  if (apiName == 'Dishgen') {
    final lastUse = FFAppState().LastUseDateDishgen;
    final useCount = FFAppState().UseCountDishgen;

    if (lastUse == null || lastUse.isBefore(today)) {
      FFAppState().LastUseDateDishgen = today;
      FFAppState().UseCountDishgen = 1;
      return true;
    }

    if (useCount >= FFAppState().ApiDayLimit) return false;

    FFAppState().UseCountDishgen += 1;
    return true;
  }

  // Scan logic
  if (apiName == 'Scan') {
    final lastUse = FFAppState().LastUseDateScan;
    final useCount = FFAppState().UseCountScan;

    if (lastUse == null || lastUse.isBefore(today)) {
      FFAppState().LastUseDateScan = today;
      FFAppState().UseCountScan = 1;
      return true;
    }

    if (useCount >= FFAppState().ApiDayLimit) return false;

    FFAppState().UseCountScan += 1;
    return true;
  }

  // Unknown API
  print("Unknown API name passed to checkAndUpdateApiUsageLimit: $apiName");
  return false;
}
