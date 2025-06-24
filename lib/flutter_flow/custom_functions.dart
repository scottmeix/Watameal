import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime stringtoDate(String stringDate) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  print('======start======\n stringDate is ${stringDate}');
  if (stringDate == null) {
    stringDate = '2100-01-01';
  }
  DateTime datetime = formatter.parse(stringDate);
  print('datetime is ${datetime}');
  print('====end====');
  return datetime;
}

String? parseCookingOptions(
  int mealType,
  int mealTime,
  int mealContent,
  String? custItem,
  String? custInstr,
) {
  List<String> meal_type = ["any", "breakfast", "lunch", "dinner", "snack"];
  List<String> cook_time = ["any", "10", "15", "30", "45"];
  List<String> meal_content = ["any", "meat", "veggie"];

  // Ensure indices are within valid range
  if (mealType < 0 ||
      mealType >= meal_type.length ||
      mealTime < 0 ||
      mealTime >= cook_time.length ||
      mealContent < 0 ||
      mealContent >= meal_content.length) {
    return null; // Return null if any index is out of range
  }
  String instr_inv =
      "Based on my inventory (chicken, onion, garlic, soy sauce,lamb,mushroom,banana,bread,brocolli, beef, sprouts, chives, eggs), ";
  String instr_content = "suggest a ${meal_content[mealContent]} recipe ";
  String instr_type = "for ${meal_type[mealType]} ";
  String instr_time =
      "with a cooking time under ${cook_time[mealTime]} minutes";
  // Optional instruction strings
  String instr_item = custItem != null
      ? ", must include these ingredients in cooking: $custItem"
      : "";
  String instr_other = custInstr != null
      ? ", must follow these additional instructions: $custInstr"
      : "";

  return "$instr_inv$instr_content$instr_type$instr_time$instr_item$instr_other";
}

dynamic stringtoJson(String response) {
  return json.decode(response);
}

List<DishInfoStruct>? responseStringtoDatatype(String? response) {
/*
  if (response == null) {
    return null;
  }

  try {
    // Decode the JSON response into a List<dynamic>
    List<Map<String, dynamic>> decodedJson =
        List<Map<String, dynamic>>.from(json.decode(response));

    // Convert each element in the decoded list into a DishInfoStruct using fromMap
    List<DishInfoStruct> dishes = decodedJson.map((item) {
      return DishInfoStruct.fromMap(item as Map<String, dynamic>);
    }).toList();

    return dishes;
  } catch (e) {
    // Handle any errors during decoding or conversion
    print('Error decoding JSON: $e');
    return null;
  }
*/
  if (response == null) {
    return null;
  }

  try {
    // Decode the JSON response into a Map<String, dynamic>
    Map<String, dynamic> decodedJson = json.decode(response);
    print("===================DEBUG: GPT API Dish Rec response:  ${response}");

    // Extract the "options" list
    var optionsList = decodedJson["options"];

    // Ensure the extracted value is a List
    if (optionsList is List) {
      // Convert it to List<Map<String, dynamic>>
      List<Map<String, dynamic>> dishList =
          List<Map<String, dynamic>>.from(optionsList);

      // Map each JSON object to a DishInfoStruct
      List<DishInfoStruct> dishes = dishList.map((item) {
        return DishInfoStruct(
          dishName: item["dish_name"] as String?,
          cookingTime: _parseCookingTime(
              item["cooking_time"]), // Convert cooking time to int
          ingredients: List<String>.from(item["required_ingredients"] ?? []),
          instructions: _splitInstructions(item["instructions"] as String?),
          image: item["image"]
              as String?, // Your JSON doesn't have images, so this will be null
        );
      }).toList();

      return dishes;
    } else {
      print("Error: 'options' key does not contain a list.");
      return null;
    }
  } catch (e) {
    print('Error decoding JSON: $e');
    return null;
  }
}

// Helper function to parse cooking time (extract integer from "25 minutes")
int? _parseCookingTime(String? timeString) {
  if (timeString == null) return null;
  return int.tryParse(RegExp(r'\d+').firstMatch(timeString)?.group(0) ?? '');
}

// Helper function to split instructions into a list
List<String> _splitInstructions(String? instructions) {
  if (instructions == null) return [];
  return instructions
      .split(RegExp(r'\d+\.\s'))
      .where((s) => s.isNotEmpty)
      .toList();
}

double addDecimal(String inputString) {
  double returnvalue;
  // Check if the string contains a decimal point
  if (inputString.contains('.')) {
    returnvalue = double.parse(
        inputString); // If it already has a decimal point, return the value as is
    print(
        "=============DEBUG: AddDecimal: $inputString is decimal, return $returnvalue");
    return returnvalue;
  } else {
    returnvalue =
        double.parse(inputString + '.0'); // If no decimal, add '.0' to it
    print(
        "=============DEBUG: AddDecimal: $inputString is NOT decimal, return $returnvalue");
    return returnvalue;
  }
}
