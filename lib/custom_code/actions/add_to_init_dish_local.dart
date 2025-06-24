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

Future addToInitDishLocal(int sourceIndex) async {
  // Add your function code here!
  // Safety checks
  if (sourceIndex < 0 || sourceIndex >= FFAppState().DishLocal.length) {
    print("Invalid source index: $sourceIndex");
    return;
  }

  // Get the dish from DishLocal
  final sourceDish = FFAppState().DishLocal[sourceIndex];

  // Copy the dish to InitDishLocal
  // If there is an empty slot, use it — else append.
  int targetIndex = -1;

  for (int i = 0; i < FFAppState().InitDishLocal.length; i++) {
    if (FFAppState().InitDishLocal[i].dishName.isEmpty) {
      targetIndex = i;
      break;
    }
  }

  // If no empty slot, append
  if (targetIndex == -1) {
    FFAppState().update(() {
      FFAppState().InitDishLocal.add(sourceDish);
      FFAppState()
          .InitDishLocalIndexes
          .add(FFAppState().InitDishLocal.length - 1);
    });
    print(
        "Dish copied to InitDishLocal at new index: ${FFAppState().InitDishLocal.length - 1}");
  } else {
    // If found an empty slot, replace it
    FFAppState().update(() {
      FFAppState().InitDishLocal[targetIndex] = sourceDish;
      FFAppState().InitDishLocalIndexes.add(targetIndex);
    });
    print("Dish copied to InitDishLocal at existing empty index: $targetIndex");
  }
}
