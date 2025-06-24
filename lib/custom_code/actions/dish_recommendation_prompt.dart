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
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//////////////////////////// Dev prompt
const String devPrompt = '''
  You are a helpful cooking assistant.

  The user will provide:
  1. Inventory list
  2. Preferences:
    - Meal Type: breakfast, lunch, dinner, snack, or any
    - Cook Time: total time available to cook, or any
    - Meal Content: meat, veggie, or any
    - Desired Ingredients: extra ingredients nominated by user, must be included in recipe for all 4 dish options 
    - Custom Instructions: additional instructions that must be followed for all 4 dish options

  Your task:
  - Recommend 4 dish options matching preferences and available ingredients
  - Each dish should include:
    - dish_name (string)
    - cooking_time (integer, in minutes)
    - required_ingredients (list of strings, ingredients with approximate quantities)
    - instructions (list of clear, step-by-step strings)

  Important instruction formatting rules:
  - Make sure to cook with [Desired Ingredients] and [Custom Instructions] specified by user in user preferences.
  - Use clear, numbered steps
  - Write as if guiding a complete beginner
  - Be very specific: include quantities, temperatures, and estimated times in each step
  - Specify when and how to add each ingredient
  - Avoid vague steps like “cook until done”; instead say “cook for 3–5 minutes until onions are soft and slightly golden”
  - Give visual/sensory cues when helpful (e.g. “until fragrant”, “until lightly browned”, “until tender when pierced with a fork”)
  - If waiting is needed, suggest a parallel task (e.g. “While waiting, chop the vegetables”)
  - Keep the tone friendly and supportive
''';
//////////////////////////// User prompt is down there
//////////////////////////// Function
Map<String, dynamic> functionDish = {
  "name": "return_dish_options",
  "description": "Return 4 recommended dish options.",
  "parameters": {
    "type": "object",
    "properties": {
      "options": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "dish_name": {"type": "string"},
            "cooking_time": {"type": "integer"},
            "required_ingredients": {
              "type": "array",
              "items": {"type": "string"}
            },
            "instructions": {
              "type": "array",
              "items": {"type": "string"}
            }
          },
          "required": [
            "dish_name",
            "cooking_time",
            "required_ingredients",
            "instructions"
          ]
        }
      }
    },
    "required": ["options"]
  }
};

Future<bool> dishRecommendationPrompt(
  int mealType,
  int mealTime,
  int mealContent,
  String? custItem,
  String? custInstr,
) async {
  // Add your function code here!
  try {
    print("===================DEBUG: DishRecACTION: START");
    // 1. Open SQLite Database
    final database = await openDatabase(
      join(await getDatabasesPath(), 'new_database_local.db'),
      version: 1,
    );

    // 2. Fetch Inventory from SQLite Database
    List<Map<String, dynamic>> inventory = await database.query('inventory');

    // 3. Prepare Inventory Data to send to GPT API
    /*
    List<String> inventoryList = [];
    for (var item in inventory) {
      inventoryList
          .add('${item['item_name']} (${item['count']} ${item['unit']})');
    }
    */
    List<String> inventoryList = inventory.map((item) {
      return '${item['count']} ${item['unit']} ${item['item_name']}';
    }).toList();

    // 4. Decode user preferences
    List<String> meal_type = ["any", "breakfast", "lunch", "dinner", "snack"];
    List<String> cook_time = ["any", "10", "15", "30", "45"];
    List<String> meal_content = ["any", "meat", "veggie"];

    String selectedMealType = meal_type[mealType];
    String selectedCookTime = cook_time[mealTime];
    String selectedMealContent = meal_content[mealContent];

    // 5. Prepare prompt for GPT API
    String userPrompt = '''
      Suggest cooking options with following inventory and preferences: 

      Inventory:
      ${inventoryList.join(", ")}

      Preferences:
      - Meal Type: $selectedMealType
      - Cook Time: $selectedCookTime
      - Meal Content: $selectedMealContent
      - Desired Ingredients: $custItem
      - Custom Instructions: $custInstr
    ''';
    FFAppState().PromptDishRecDev = devPrompt;
    FFAppState().PromptDishRec = userPrompt;

    // 6. Setup OpenAI request
    final apiKey = FFAppState().APIKey;
    const endpoint = 'https://api.openai.com/v1/chat/completions';

    final requestBody = {
      "model": "gpt-4o-mini",
      "messages": [
        {"role": "developer", "content": devPrompt},
        {"role": "user", "content": userPrompt},
      ],
      "tools": [
        {"type": "function", "function": functionDish}
      ],
      "tool_choice": {
        "type": "function",
        "function": {"name": "return_dish_options"}
      },
      "temperature": 0.7
    };

    print("===================DEBUG: DishRecACTION: Send");
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestBody),
    );
    print("===================DEBUG: DishRecACTION: Await Done");

    if (response.statusCode != 200) {
      print("OpenAI API error: ${response.body}");
      return false;
    }

    final body = jsonDecode(response.body);
    FFAppState().ResponseDishRec = body;
    print("===================DEBUG: DishRecACTION: Response: ${body}");
    final message = body['choices'][0]['message'];

    if (message['tool_calls'][0]['function']['arguments'] == null) {
      print("No valid function argument in response.");
      return false;
    }

    final argsJson = message['tool_calls'][0]['function']['arguments'];
    final args = jsonDecode(argsJson);
    final options = args['options'];

    // 5. Convert to List<DishInfoStruct>
    List<DishInfoStruct> newDishes = (options as List)
        .map((item) => DishInfoStruct(
              dishName: item['dish_name'],
              cookingTime: item['cooking_time'],
              ingredients:
                  List<String>.from(item['required_ingredients'] ?? []),
              instructions: List<String>.from(item['instructions'] ?? []),
            ))
        .toList();

    // 6. Modify existing DishLocal with new dishes, without overriding liked dishes
    List<DishInfoStruct> dishes = FFAppState().DishLocal;
    List<int> updatedIndexes = []; // Initialize index list for tracking changes

    // 7. Loop through existing dishes and replace only unliked ones
    int newDishIndex = 0;
    for (int i = 0; i < dishes.length && newDishIndex < newDishes.length; i++) {
      if (dishes[i].liked == true) continue; // Skip liked dishes
      dishes[i] = newDishes[newDishIndex]; // Replace unliked dish
      updatedIndexes.add(i); // Track the index of the replacement
      newDishIndex++;
    }

    // 8. If there are remaining new dishes, append them
    if (newDishIndex < newDishes.length) {
      for (int i = newDishIndex; i < newDishes.length; i++) {
        dishes.add(newDishes[i]);
        updatedIndexes.add(dishes.length - 1); // Track new indexes
      }
    }

    // 9. Store the updated dishes and index list to FFAppState
    FFAppState().update(() {
      FFAppState().DishLocal = dishes;
      FFAppState().DishLocalIndexes = updatedIndexes; // Store updated indexes
    });

    return true;
  } catch (e, stack) {
    print("Error during GPT API Dish Rec call: $e");
    print(stack);
    return false;
  }
  print("===================DEBUG: DishRecACTION: END");
}
