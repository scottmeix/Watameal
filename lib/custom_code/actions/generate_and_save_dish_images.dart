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

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future generateAndSaveDishImages(
  List<DishInfoStruct>? dishLocal,
  int mealType,
  String? custInstr,
) async {
  // Add your function code here!

  print(
      "===================DEBUG: ImageACTION: In generateAndSaveDishImages Action");
  if (dishLocal == null || dishLocal.isEmpty) {
    print("No dishes to process.");
    return;
  }

  final String apiKey = FFAppState().APIKey;
  const String apiUrl = 'https://api.openai.com/v1/images/generations';

  List<String> meal_type_array = [
    "any",
    "breakfast",
    "lunch",
    "dinner",
    "snack"
  ];
  String meal_type = meal_type_array[mealType];
  String meal_type_instr = (meal_type == "any") ? "" : "in a $meal_type format";
  /*String meal_cust_instr =
      (custInstr == "") ? "" : "with these user preference: $custInstr";
      "This dish is made $meal_type_instr "
  */
  // Limit the number of dishes processed to 4
  // final dishesToProcess = dishLocal.take(4).toList();
  // get 4 available entries that's not liked
  final List<MapEntry<int, DishInfoStruct>> availableDishes = dishLocal
      .asMap()
      .entries
      .where((entry) => entry.value.liked != true) // don't use liked
      .take(4)
      .toList();

  if (availableDishes.isEmpty) {
    print("No unliked dishes to process.");
    return;
  }

  // save 4 indexes to FFAppState
  FFAppState().DishLocalIndexes = availableDishes.map((e) => e.key).toList();

  // Use Future.wait to execute requests in parallel
  await Future.wait(availableDishes.map((entry) async {
    final int index = entry.key;
    final DishInfoStruct dish = entry.value;
    final String dishName = dish.dishName;
    final String cookingInstructions = dish.instructions.join(" ");

    final String prompt = '''
        A realistic image of a meal cooked with the following process: $cookingInstructions.
        Only generate the image of final outcome, not the mid-steps.
        The dish should look very realisic, delicious and pleasing, cooked ingredients should not look raw, do not include inedible things in the dish such as fruit pit. Present in a realistic setting
        ''';
    print("===================DEBUG: ImageACTION: before try api");
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "dall-e-3",
          "prompt": prompt,
          "n": 1,
          "size": "1024x1024"
        }),
      );

      print("===================DEBUG: ImageACTION: after await api");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'].isNotEmpty) {
          final String imageUrl = data['data'][0]['url'];
          /*
          final String? localImagePath =
              await downloadAndSaveImage(imageUrl, dishName);
          if (localImagePath != null) {
            print(
                "===================DEBUG: ImageACTION: localImagePath: $localImagePath");
            dish.image = localImagePath;
          }
          */
          //dish.image = imageUrl;
          dishLocal[index].image = imageUrl;
          print("===================DEBUG: ImageACTION: imageUrl: $imageUrl");
        } else {
          print("No image data received for $dishName.");
        }
      } else {
        print("Failed to generate image for $dishName: ${response.body}");
      }
    } catch (e) {
      print("Error processing $dishName: $e");
    }
  }).toList());

  FFAppState().DishLocal =
      List.from(dishLocal); // Assign the updated list to app state
  print("===================DEBUG: ImageACTION: Exit Action");
}

Future<String?> downloadAndSaveImage(String imageUrl, String dishName) async {
  print("===================DEBUG: ImageACTION: in downloadAndSaveImage");
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$dishName.jpg';
      final File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else {
      print("Failed to download image: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Error downloading image: $e");
    return null;
  }
}
