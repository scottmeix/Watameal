import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'new_database_local',
      'Watameal_database.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetTempRow>> getTemp() => performGetTemp(
        _database,
      );

  Future<List<GetCategoryRow>> getCategory({
    String? category,
  }) =>
      performGetCategory(
        _database,
        category: category,
      );

  Future<List<GetRowRow>> getRow({
    int? itemid,
  }) =>
      performGetRow(
        _database,
        itemid: itemid,
      );

  Future<List<GetExpiredRow>> getExpired() => performGetExpired(
        _database,
      );

  Future<List<FetchLikedRow>> fetchLiked() => performFetchLiked(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future updateFrozen({
    bool? frozen,
    int? itemid,
  }) =>
      performUpdateFrozen(
        _database,
        frozen: frozen,
        itemid: itemid,
      );

  Future deleteItem({
    int? itemid,
  }) =>
      performDeleteItem(
        _database,
        itemid: itemid,
      );

  Future updateTemp() => performUpdateTemp(
        _database,
      );

  Future addItem({
    String? itemname,
    String? count,
    String? unit,
    DateTime? expiration,
    bool? frozen,
    String? category,
    bool? temp,
  }) =>
      performAddItem(
        _database,
        itemname: itemname,
        count: count,
        unit: unit,
        expiration: expiration,
        frozen: frozen,
        category: category,
        temp: temp,
      );

  Future setDate({
    DateTime? expiration,
    int? itemid,
  }) =>
      performSetDate(
        _database,
        expiration: expiration,
        itemid: itemid,
      );

  Future clearInventory() => performClearInventory(
        _database,
      );

  Future updateItem({
    String? itemname,
    String? count,
    String? unit,
    DateTime? expiration,
    bool? frozen,
    String? category,
    int? itemid,
  }) =>
      performUpdateItem(
        _database,
        itemname: itemname,
        count: count,
        unit: unit,
        expiration: expiration,
        frozen: frozen,
        category: category,
        itemid: itemid,
      );

  Future clearNull() => performClearNull(
        _database,
      );

  Future clearLast() => performClearLast(
        _database,
      );

  Future setLikedEntry({
    int? variableindex,
  }) =>
      performSetLikedEntry(
        _database,
        variableindex: variableindex,
      );

  Future testQuery({
    int? variableindex,
  }) =>
      performTestQuery(
        _database,
        variableindex: variableindex,
      );

  Future removeLikedEntry({
    int? variableindex,
  }) =>
      performRemoveLikedEntry(
        _database,
        variableindex: variableindex,
      );

  Future extendExpired() => performExtendExpired(
        _database,
      );

  Future deleteExpired() => performDeleteExpired(
        _database,
      );

  Future clearLiked() => performClearLiked(
        _database,
      );

  /// END UPDATE QUERY CALLS
}
