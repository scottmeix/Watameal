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

import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<FFUploadedFile> pickImage(bool isCamera) async {
  // Add your function code here!
  try {
    final picker = ImagePicker();

    // Pick an image from the gallery
    final XFile? pickedFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      // Convert file to bytes
      Uint8List bytes = await pickedFile.readAsBytes();

      // Return FFUploadedFile with name and bytes
      return FFUploadedFile(
        name: pickedFile.name,
        bytes: bytes,
      );
    } else {
      return FFUploadedFile(); // Return empty FFUploadedFile if no image selected
    }
  } catch (e) {
    print("Error picking image: $e");
    return FFUploadedFile(); // Return empty FFUploadedFile in case of error
  }
}
