import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETTEMP
Future<List<GetTempRow>> performGetTemp(
  Database database,
) {
  final query = '''
select * from inventory where temp = 'true';
''';
  return _readQuery(database, query, (d) => GetTempRow(d));
}

class GetTempRow extends SqliteRow {
  GetTempRow(Map<String, dynamic> data) : super(data);

  String get itemName => data['item_name'] as String;
  String? get count => data['count'] as String?;
  String? get unit => data['unit'] as String?;
  String? get expiration => data['expiration'] as String?;
  String? get frozen => data['frozen'] as String?;
  String? get category => data['category'] as String?;
  bool? get temp => data['temp'] as bool?;
  int get itemId => data['item_id'] as int;
}

/// END GETTEMP

/// BEGIN GETCATEGORY
Future<List<GetCategoryRow>> performGetCategory(
  Database database, {
  String? category,
}) {
  final query = '''
select * from inventory where category = '${category}' AND temp='false';
''';
  return _readQuery(database, query, (d) => GetCategoryRow(d));
}

class GetCategoryRow extends SqliteRow {
  GetCategoryRow(Map<String, dynamic> data) : super(data);

  String get itemName => data['item_name'] as String;
  String? get count => data['count'] as String?;
  String? get unit => data['unit'] as String?;
  String? get expiration => data['expiration'] as String?;
  String? get frozen => data['frozen'] as String?;
  String? get category => data['category'] as String?;
  bool? get temp => data['temp'] as bool?;
  int get itemId => data['item_id'] as int;
}

/// END GETCATEGORY

/// BEGIN GETROW
Future<List<GetRowRow>> performGetRow(
  Database database, {
  int? itemid,
}) {
  final query = '''
select * from inventory where item_id = '${itemid}';
''';
  return _readQuery(database, query, (d) => GetRowRow(d));
}

class GetRowRow extends SqliteRow {
  GetRowRow(Map<String, dynamic> data) : super(data);

  String get itemName => data['item_name'] as String;
  String? get count => data['count'] as String?;
  String? get unit => data['unit'] as String?;
  String? get expiration => data['expiration'] as String?;
  String? get frozen => data['frozen'] as String?;
  String? get category => data['category'] as String?;
  bool? get temp => data['temp'] as bool?;
  int get itemId => data['item_id'] as int;
}

/// END GETROW

/// BEGIN GETEXPIRED
Future<List<GetExpiredRow>> performGetExpired(
  Database database,
) {
  final query = '''
SELECT *
FROM inventory
WHERE frozen != 'true'
 AND temp != 'true'
  AND (
    (expiration != '2100-01-01' AND DATE(expiration) < DATE('now'))
    OR
    (expiration = '2100-01-01' AND (
        (category = 'Fruit' AND DATE(last_updated) < DATE('now', '-14 days')) OR
        (category = 'Vegetable' AND DATE(last_updated) < DATE('now', '-14 days')) OR
        (category = 'Meat' AND DATE(last_updated) < DATE('now', '-7 days'))
    ))
  );
''';
  return _readQuery(database, query, (d) => GetExpiredRow(d));
}

class GetExpiredRow extends SqliteRow {
  GetExpiredRow(Map<String, dynamic> data) : super(data);

  String get itemName => data['item_name'] as String;
  String? get count => data['count'] as String?;
  String? get unit => data['unit'] as String?;
  String? get expiration => data['expiration'] as String?;
  String? get frozen => data['frozen'] as String?;
  String? get category => data['category'] as String?;
  int get itemId => data['item_id'] as int;
}

/// END GETEXPIRED

/// BEGIN FETCHLIKED
Future<List<FetchLikedRow>> performFetchLiked(
  Database database,
) {
  final query = '''
select * from liked_dish_table
''';
  return _readQuery(database, query, (d) => FetchLikedRow(d));
}

class FetchLikedRow extends SqliteRow {
  FetchLikedRow(Map<String, dynamic> data) : super(data);

  int get dishLocalIndex => data['Dish_Local_Index'] as int;
}

/// END FETCHLIKED
