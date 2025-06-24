// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DishInfoStruct extends BaseStruct {
  DishInfoStruct({
    String? dishName,
    int? cookingTime,
    List<String>? ingredients,
    List<String>? instructions,
    String? image,
    bool? liked,
  })  : _dishName = dishName,
        _cookingTime = cookingTime,
        _ingredients = ingredients,
        _instructions = instructions,
        _image = image,
        _liked = liked;

  // "dish_name" field.
  String? _dishName;
  String get dishName => _dishName ?? '';
  set dishName(String? val) => _dishName = val;

  bool hasDishName() => _dishName != null;

  // "cooking_time" field.
  int? _cookingTime;
  int get cookingTime => _cookingTime ?? 0;
  set cookingTime(int? val) => _cookingTime = val;

  void incrementCookingTime(int amount) => cookingTime = cookingTime + amount;

  bool hasCookingTime() => _cookingTime != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  set ingredients(List<String>? val) => _ingredients = val;

  void updateIngredients(Function(List<String>) updateFn) {
    updateFn(_ingredients ??= []);
  }

  bool hasIngredients() => _ingredients != null;

  // "instructions" field.
  List<String>? _instructions;
  List<String> get instructions => _instructions ?? const [];
  set instructions(List<String>? val) => _instructions = val;

  void updateInstructions(Function(List<String>) updateFn) {
    updateFn(_instructions ??= []);
  }

  bool hasInstructions() => _instructions != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "liked" field.
  bool? _liked;
  bool get liked => _liked ?? false;
  set liked(bool? val) => _liked = val;

  bool hasLiked() => _liked != null;

  static DishInfoStruct fromMap(Map<String, dynamic> data) => DishInfoStruct(
        dishName: data['dish_name'] as String?,
        cookingTime: castToType<int>(data['cooking_time']),
        ingredients: getDataList(data['ingredients']),
        instructions: getDataList(data['instructions']),
        image: data['image'] as String?,
        liked: data['liked'] as bool?,
      );

  static DishInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? DishInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dish_name': _dishName,
        'cooking_time': _cookingTime,
        'ingredients': _ingredients,
        'instructions': _instructions,
        'image': _image,
        'liked': _liked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dish_name': serializeParam(
          _dishName,
          ParamType.String,
        ),
        'cooking_time': serializeParam(
          _cookingTime,
          ParamType.int,
        ),
        'ingredients': serializeParam(
          _ingredients,
          ParamType.String,
          isList: true,
        ),
        'instructions': serializeParam(
          _instructions,
          ParamType.String,
          isList: true,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'liked': serializeParam(
          _liked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DishInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DishInfoStruct(
        dishName: deserializeParam(
          data['dish_name'],
          ParamType.String,
          false,
        ),
        cookingTime: deserializeParam(
          data['cooking_time'],
          ParamType.int,
          false,
        ),
        ingredients: deserializeParam<String>(
          data['ingredients'],
          ParamType.String,
          true,
        ),
        instructions: deserializeParam<String>(
          data['instructions'],
          ParamType.String,
          true,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        liked: deserializeParam(
          data['liked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DishInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DishInfoStruct &&
        dishName == other.dishName &&
        cookingTime == other.cookingTime &&
        listEquality.equals(ingredients, other.ingredients) &&
        listEquality.equals(instructions, other.instructions) &&
        image == other.image &&
        liked == other.liked;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([dishName, cookingTime, ingredients, instructions, image, liked]);
}

DishInfoStruct createDishInfoStruct({
  String? dishName,
  int? cookingTime,
  String? image,
  bool? liked,
}) =>
    DishInfoStruct(
      dishName: dishName,
      cookingTime: cookingTime,
      image: image,
      liked: liked,
    );
