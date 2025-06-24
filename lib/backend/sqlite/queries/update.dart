import 'package:sqflite/sqflite.dart';

/// BEGIN UPDATEFROZEN
Future performUpdateFrozen(
  Database database, {
  bool? frozen,
  int? itemid,
}) {
  final query = '''
update inventory set frozen = '${frozen}' where item_id = '${itemid}';
''';
  return database.rawQuery(query);
}

/// END UPDATEFROZEN

/// BEGIN DELETEITEM
Future performDeleteItem(
  Database database, {
  int? itemid,
}) {
  final query = '''
delete from inventory where item_id = '${itemid}';
''';
  return database.rawQuery(query);
}

/// END DELETEITEM

/// BEGIN UPDATETEMP
Future performUpdateTemp(
  Database database,
) {
  final query = '''
update inventory set temp = 'false' where temp = 'true';
''';
  return database.rawQuery(query);
}

/// END UPDATETEMP

/// BEGIN ADDITEM
Future performAddItem(
  Database database, {
  String? itemname,
  String? count,
  String? unit,
  DateTime? expiration,
  bool? frozen,
  String? category,
  bool? temp,
}) {
  final query = '''
insert into inventory (item_name,count,unit,expiration,frozen,category,temp) values ('${itemname}','${count}','${unit}','${expiration}','${frozen}','${category}','${temp}');
''';
  return database.rawQuery(query);
}

/// END ADDITEM

/// BEGIN SETDATE
Future performSetDate(
  Database database, {
  DateTime? expiration,
  int? itemid,
}) {
  final query = '''
update inventory set expiration = '${expiration}', frozen='false' where item_id = ${itemid};
''';
  return database.rawQuery(query);
}

/// END SETDATE

/// BEGIN CLEARINVENTORY
Future performClearInventory(
  Database database,
) {
  final query = '''
delete from inventory;
''';
  return database.rawQuery(query);
}

/// END CLEARINVENTORY

/// BEGIN UPDATEITEM
Future performUpdateItem(
  Database database, {
  String? itemname,
  String? count,
  String? unit,
  DateTime? expiration,
  bool? frozen,
  String? category,
  int? itemid,
}) {
  final query = '''
update inventory set item_name = '${itemname}', count='${count}', unit = '${unit}', expiration = '${expiration}', frozen = '${frozen}', category = '${category}' where item_id = '${itemid}';
''';
  return database.rawQuery(query);
}

/// END UPDATEITEM

/// BEGIN CLEARNULL
Future performClearNull(
  Database database,
) {
  final query = '''
DELETE FROM inventory
WHERE frozen IS null OR expiration IS null;
''';
  return database.rawQuery(query);
}

/// END CLEARNULL

/// BEGIN CLEARLAST
Future performClearLast(
  Database database,
) {
  final query = '''
DELETE FROM inventory 
WHERE item_id = (SELECT MAX(item_id) FROM inventory);
''';
  return database.rawQuery(query);
}

/// END CLEARLAST

/// BEGIN SETLIKEDENTRY
Future performSetLikedEntry(
  Database database, {
  int? variableindex,
}) {
  final query = '''
INSERT INTO liked_dish_table (Dish_Local_Index) VALUES (${variableindex});
''';
  return database.rawQuery(query);
}

/// END SETLIKEDENTRY

/// BEGIN TESTQUERY
Future performTestQuery(
  Database database, {
  int? variableindex,
}) {
  final query = '''
insert into liked_dish_table(Dish_Local_Index) values(${variableindex});
''';
  return database.rawQuery(query);
}

/// END TESTQUERY

/// BEGIN REMOVELIKEDENTRY
Future performRemoveLikedEntry(
  Database database, {
  int? variableindex,
}) {
  final query = '''
DELETE FROM liked_dish_table WHERE Dish_Local_Index = ${variableindex};
''';
  return database.rawQuery(query);
}

/// END REMOVELIKEDENTRY

/// BEGIN EXTENDEXPIRED
Future performExtendExpired(
  Database database,
) {
  final query = '''
UPDATE inventory
SET expiration = DATE('now', '+7 days')
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
  return database.rawQuery(query);
}

/// END EXTENDEXPIRED

/// BEGIN DELETEEXPIRED
Future performDeleteExpired(
  Database database,
) {
  final query = '''
DELETE FROM inventory
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
  return database.rawQuery(query);
}

/// END DELETEEXPIRED

/// BEGIN CLEARLIKED
Future performClearLiked(
  Database database,
) {
  final query = '''
delete from liked_dish_table
''';
  return database.rawQuery(query);
}

/// END CLEARLIKED
