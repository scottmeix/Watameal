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

Future<int> supaGetEmailCount(String? email) async {
  // Add your function code here!
  print('======== DEBUG: In supaGetEmailCount with email: $email');
  try {
    final response = await Supabase.instance.client
        .rpc('count_users_by_email', params: {'email_input': email});

    if (response == null) {
      print('=======supaGetEmailCount response is null: ${response}');
      return 0;
    }

    print('========supaGetEmailCount Response: $response');
    // Assuming the function returns an integer
    return response as int;
  } catch (e) {
    print('Exception: $e');
    return -1;
  }
}
