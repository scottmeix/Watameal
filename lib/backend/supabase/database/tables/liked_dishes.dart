import '../database.dart';

class LikedDishesTable extends SupabaseTable<LikedDishesRow> {
  @override
  String get tableName => 'liked_dishes';

  @override
  LikedDishesRow createRow(Map<String, dynamic> data) => LikedDishesRow(data);
}

class LikedDishesRow extends SupabaseDataRow {
  LikedDishesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LikedDishesTable();

  int get dishId => getField<int>('dish_id')!;
  set dishId(int value) => setField<int>('dish_id', value);

  String get dishName => getField<String>('dish_name')!;
  set dishName(String value) => setField<String>('dish_name', value);

  String get ingredients => getField<String>('ingredients')!;
  set ingredients(String value) => setField<String>('ingredients', value);

  String get steps => getField<String>('steps')!;
  set steps(String value) => setField<String>('steps', value);

  String? get cookingTime => getField<String>('cooking_time');
  set cookingTime(String? value) => setField<String>('cooking_time', value);

  String? get mealType => getField<String>('meal_type');
  set mealType(String? value) => setField<String>('meal_type', value);

  String? get mealTime => getField<String>('meal_time');
  set mealTime(String? value) => setField<String>('meal_time', value);

  DateTime? get likedDate => getField<DateTime>('liked_date');
  set likedDate(DateTime? value) => setField<DateTime>('liked_date', value);
}
