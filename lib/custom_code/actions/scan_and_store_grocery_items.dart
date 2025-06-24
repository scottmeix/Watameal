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
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Define the GPT function schema
Map<String, dynamic> functionitems = {
  "name": "grocery_items",
  "description":
      "Extracts grocery items from an image of receipt or real items",
  "parameters": {
    "type": "object",
    "properties": {
      "items": {
        "type": "array",
        "description": "List of grocery items",
        "items": {
          "type": "object",
          "properties": {
            "item_name": {"type": "string"},
            "count": {
              "type": "string",
              "description":
                  "the number string in weight/quantity, e.g. the '15' in 15kg"
            },
            "unit": {
              "type": "string",
              "enum": ["liter", "oz", "kg", "g", "lb", "unit"],
              "description":
                  "Use 'unit' if other types in enum are not explicitly found"
            },
            "expiration": {
              "type": "string",
              "format": "date",
              "description":
                  "Return date in yyyy-mm-dd if date found, otherwise return 2100-01-01"
            },
            "frozen": {"type": "boolean"},
            "category": {
              "type": "string",
              "enum": [
                "Meat",
                "Fruit",
                "Vegetable",
                "ReadyToEat",
                "Seasonings",
                "Others"
              ]
            }
          },
          "required": [
            "item_name",
            "count",
            "unit",
            "expiration",
            "frozen",
            "category"
          ]
        }
      }
    }
  }
};

Future<bool> scanAndStoreGroceryItems(FFUploadedFile uploadedFile) async {
  // Add your function code here!
  final String apiKey = FFAppState().APIKey;
  const String apiUrl = "https://api.openai.com/v1/chat/completions";

  Uint8List? fileBytes = uploadedFile.bytes;
  if (fileBytes == null) {
    print("Error: uploadedFile is empty.");
    return false;
  }
  String base64Image = base64Encode(fileBytes);

  try {
    // Create API request payload
    Map<String, dynamic> requestBody = {
      "model": "gpt-4o",
      "messages": [
        {
          "role": "developer",
          "content":
              "You are an AI that extracts cooking related grocery items from images of receipt or actual item"
        },
        {
          "role": "user",
          "content": [
            {
              "type": "text",
              "text": "Extract grocery items with details from this image."
            },
            {
              "type": "image_url",
              "image_url": {"url": "data:image/jpeg;base64,$base64Image"}
            }
          ]
        }
      ],
      "functions": [functionitems], // Use function calling
      "function_call": {"name": "grocery_items"},
      "max_tokens": 10000
    };

    // Send POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestBody),
    );

    // Check for response success
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      //// Debug Start
      print(
          "===================DEBUG: GPT Vision API response:  ${response.body}");
      FFAppState().JsonItems = jsonResponse;
      //// Debug End
      if (jsonResponse["choices"] == null ||
          jsonResponse["choices"][0]["message"]["function_call"] == null) {
        print("Invalid GPT response: ${response.body}");
        return false;
      }

      var functionArgs = jsonDecode(
          jsonResponse["choices"][0]["message"]["function_call"]["arguments"]);
      List<Map<String, dynamic>> groceryItems =
          List<Map<String, dynamic>>.from(functionArgs["items"]);

      if (groceryItems.isEmpty) {
        print("No grocery detected in image: ${response.body}");
        return false;
      }

      // Store extracted items in SQLite database
      await storeGroceryItems(groceryItems);

      print("✅ Items successfully saved to inventory!");
      return true;
    } else {
      throw Exception("API Error: ${response.body}");
    }
  } catch (e) {
    print("Error scanning image: $e");
    return false;
  }
}

// Function to insert extracted grocery items into SQLite database
Future<void> storeGroceryItems(List<Map<String, dynamic>> groceryItems) async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'new_database_local.db'),
    version: 1,
  );

  for (var item in groceryItems) {
    await database.insert(
      'inventory',
      {
        'item_name': item['item_name'],
        'count': item['count'],
        'unit': item['unit'],
        'expiration':
            (item['expiration'] == '') ? "2100-01-01" : item['expiration'],
        'frozen': item['frozen'] ? "true" : "false", // Convert boolean to text
        'category': item['category'],
        'temp': "true"
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
