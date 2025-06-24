import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_JsonItems') != null) {
        try {
          _JsonItems =
              jsonDecode(await secureStorage.getString('ff_JsonItems') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _DishLocal = (await secureStorage.getStringList('ff_DishLocal'))
              ?.map((x) {
                try {
                  return DishInfoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _DishLocal;
    });
    await _safeInitAsync(() async {
      _DishLocalIndexes =
          (await secureStorage.getStringList('ff_DishLocalIndexes'))
                  ?.map(int.parse)
                  .toList() ??
              _DishLocalIndexes;
    });
    await _safeInitAsync(() async {
      _InitDishLocal = (await secureStorage.getStringList('ff_InitDishLocal'))
              ?.map((x) {
                try {
                  return DishInfoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _InitDishLocal;
    });
    await _safeInitAsync(() async {
      _InitDishLocalIndexes =
          (await secureStorage.getStringList('ff_InitDishLocalIndexes'))
                  ?.map(int.parse)
                  .toList() ??
              _InitDishLocalIndexes;
    });
    await _safeInitAsync(() async {
      _InitDishlocalDisplayid =
          await secureStorage.getInt('ff_InitDishlocalDisplayid') ??
              _InitDishlocalDisplayid;
    });
    await _safeInitAsync(() async {
      _LastRequest =
          await secureStorage.getString('ff_LastRequest') ?? _LastRequest;
    });
    await _safeInitAsync(() async {
      _APIKey = await secureStorage.getString('ff_APIKey') ?? _APIKey;
    });
    await _safeInitAsync(() async {
      _defaultdate = await secureStorage.read(key: 'ff_defaultdate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_defaultdate'))!)
          : _defaultdate;
    });
    await _safeInitAsync(() async {
      _PromptDishRec =
          await secureStorage.getString('ff_PromptDishRec') ?? _PromptDishRec;
    });
    await _safeInitAsync(() async {
      _PromptDishRecDev =
          await secureStorage.getString('ff_PromptDishRecDev') ??
              _PromptDishRecDev;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_ResponseDishRec') != null) {
        try {
          _ResponseDishRec = jsonDecode(
              await secureStorage.getString('ff_ResponseDishRec') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _FirstLaunch =
          await secureStorage.getBool('ff_FirstLaunch') ?? _FirstLaunch;
    });
    await _safeInitAsync(() async {
      _LastUseDateDishgen =
          await secureStorage.read(key: 'ff_LastUseDateDishgen') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_LastUseDateDishgen'))!)
              : _LastUseDateDishgen;
    });
    await _safeInitAsync(() async {
      _UseCountDishgen =
          await secureStorage.getInt('ff_UseCountDishgen') ?? _UseCountDishgen;
    });
    await _safeInitAsync(() async {
      _LastUseDateScan =
          await secureStorage.read(key: 'ff_LastUseDateScan') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_LastUseDateScan'))!)
              : _LastUseDateScan;
    });
    await _safeInitAsync(() async {
      _UseCountScan =
          await secureStorage.getInt('ff_UseCountScan') ?? _UseCountScan;
    });
    await _safeInitAsync(() async {
      _ApiDayLimit =
          await secureStorage.getInt('ff_ApiDayLimit') ?? _ApiDayLimit;
    });
    await _safeInitAsync(() async {
      _UserPhoto = await secureStorage.getString('ff_UserPhoto') ?? _UserPhoto;
    });
    await _safeInitAsync(() async {
      _UserName = await secureStorage.getString('ff_UserName') ?? _UserName;
    });
    await _safeInitAsync(() async {
      _FlatInventoryView =
          await secureStorage.getBool('ff_FlatInventoryView') ??
              _FlatInventoryView;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<InventoryItemStruct> _AddInventoryTemp = [];
  List<InventoryItemStruct> get AddInventoryTemp => _AddInventoryTemp;
  set AddInventoryTemp(List<InventoryItemStruct> value) {
    _AddInventoryTemp = value;
  }

  void addToAddInventoryTemp(InventoryItemStruct value) {
    AddInventoryTemp.add(value);
  }

  void removeFromAddInventoryTemp(InventoryItemStruct value) {
    AddInventoryTemp.remove(value);
  }

  void removeAtIndexFromAddInventoryTemp(int index) {
    AddInventoryTemp.removeAt(index);
  }

  void updateAddInventoryTempAtIndex(
    int index,
    InventoryItemStruct Function(InventoryItemStruct) updateFn,
  ) {
    AddInventoryTemp[index] = updateFn(_AddInventoryTemp[index]);
  }

  void insertAtIndexInAddInventoryTemp(int index, InventoryItemStruct value) {
    AddInventoryTemp.insert(index, value);
  }

  dynamic _JsonItems;
  dynamic get JsonItems => _JsonItems;
  set JsonItems(dynamic value) {
    _JsonItems = value;
    secureStorage.setString('ff_JsonItems', jsonEncode(value));
  }

  void deleteJsonItems() {
    secureStorage.delete(key: 'ff_JsonItems');
  }

  List<DishInfoStruct> _DishLocal = [];
  List<DishInfoStruct> get DishLocal => _DishLocal;
  set DishLocal(List<DishInfoStruct> value) {
    _DishLocal = value;
    secureStorage.setStringList(
        'ff_DishLocal', value.map((x) => x.serialize()).toList());
  }

  void deleteDishLocal() {
    secureStorage.delete(key: 'ff_DishLocal');
  }

  void addToDishLocal(DishInfoStruct value) {
    DishLocal.add(value);
    secureStorage.setStringList(
        'ff_DishLocal', _DishLocal.map((x) => x.serialize()).toList());
  }

  void removeFromDishLocal(DishInfoStruct value) {
    DishLocal.remove(value);
    secureStorage.setStringList(
        'ff_DishLocal', _DishLocal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDishLocal(int index) {
    DishLocal.removeAt(index);
    secureStorage.setStringList(
        'ff_DishLocal', _DishLocal.map((x) => x.serialize()).toList());
  }

  void updateDishLocalAtIndex(
    int index,
    DishInfoStruct Function(DishInfoStruct) updateFn,
  ) {
    DishLocal[index] = updateFn(_DishLocal[index]);
    secureStorage.setStringList(
        'ff_DishLocal', _DishLocal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDishLocal(int index, DishInfoStruct value) {
    DishLocal.insert(index, value);
    secureStorage.setStringList(
        'ff_DishLocal', _DishLocal.map((x) => x.serialize()).toList());
  }

  List<int> _DishLocalIndexes = [];
  List<int> get DishLocalIndexes => _DishLocalIndexes;
  set DishLocalIndexes(List<int> value) {
    _DishLocalIndexes = value;
    secureStorage.setStringList(
        'ff_DishLocalIndexes', value.map((x) => x.toString()).toList());
  }

  void deleteDishLocalIndexes() {
    secureStorage.delete(key: 'ff_DishLocalIndexes');
  }

  void addToDishLocalIndexes(int value) {
    DishLocalIndexes.add(value);
    secureStorage.setStringList('ff_DishLocalIndexes',
        _DishLocalIndexes.map((x) => x.toString()).toList());
  }

  void removeFromDishLocalIndexes(int value) {
    DishLocalIndexes.remove(value);
    secureStorage.setStringList('ff_DishLocalIndexes',
        _DishLocalIndexes.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromDishLocalIndexes(int index) {
    DishLocalIndexes.removeAt(index);
    secureStorage.setStringList('ff_DishLocalIndexes',
        _DishLocalIndexes.map((x) => x.toString()).toList());
  }

  void updateDishLocalIndexesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    DishLocalIndexes[index] = updateFn(_DishLocalIndexes[index]);
    secureStorage.setStringList('ff_DishLocalIndexes',
        _DishLocalIndexes.map((x) => x.toString()).toList());
  }

  void insertAtIndexInDishLocalIndexes(int index, int value) {
    DishLocalIndexes.insert(index, value);
    secureStorage.setStringList('ff_DishLocalIndexes',
        _DishLocalIndexes.map((x) => x.toString()).toList());
  }

  List<DishInfoStruct> _InitDishLocal = [];
  List<DishInfoStruct> get InitDishLocal => _InitDishLocal;
  set InitDishLocal(List<DishInfoStruct> value) {
    _InitDishLocal = value;
    secureStorage.setStringList(
        'ff_InitDishLocal', value.map((x) => x.serialize()).toList());
  }

  void deleteInitDishLocal() {
    secureStorage.delete(key: 'ff_InitDishLocal');
  }

  void addToInitDishLocal(DishInfoStruct value) {
    InitDishLocal.add(value);
    secureStorage.setStringList(
        'ff_InitDishLocal', _InitDishLocal.map((x) => x.serialize()).toList());
  }

  void removeFromInitDishLocal(DishInfoStruct value) {
    InitDishLocal.remove(value);
    secureStorage.setStringList(
        'ff_InitDishLocal', _InitDishLocal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromInitDishLocal(int index) {
    InitDishLocal.removeAt(index);
    secureStorage.setStringList(
        'ff_InitDishLocal', _InitDishLocal.map((x) => x.serialize()).toList());
  }

  void updateInitDishLocalAtIndex(
    int index,
    DishInfoStruct Function(DishInfoStruct) updateFn,
  ) {
    InitDishLocal[index] = updateFn(_InitDishLocal[index]);
    secureStorage.setStringList(
        'ff_InitDishLocal', _InitDishLocal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInInitDishLocal(int index, DishInfoStruct value) {
    InitDishLocal.insert(index, value);
    secureStorage.setStringList(
        'ff_InitDishLocal', _InitDishLocal.map((x) => x.serialize()).toList());
  }

  List<int> _InitDishLocalIndexes = [];
  List<int> get InitDishLocalIndexes => _InitDishLocalIndexes;
  set InitDishLocalIndexes(List<int> value) {
    _InitDishLocalIndexes = value;
    secureStorage.setStringList(
        'ff_InitDishLocalIndexes', value.map((x) => x.toString()).toList());
  }

  void deleteInitDishLocalIndexes() {
    secureStorage.delete(key: 'ff_InitDishLocalIndexes');
  }

  void addToInitDishLocalIndexes(int value) {
    InitDishLocalIndexes.add(value);
    secureStorage.setStringList('ff_InitDishLocalIndexes',
        _InitDishLocalIndexes.map((x) => x.toString()).toList());
  }

  void removeFromInitDishLocalIndexes(int value) {
    InitDishLocalIndexes.remove(value);
    secureStorage.setStringList('ff_InitDishLocalIndexes',
        _InitDishLocalIndexes.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromInitDishLocalIndexes(int index) {
    InitDishLocalIndexes.removeAt(index);
    secureStorage.setStringList('ff_InitDishLocalIndexes',
        _InitDishLocalIndexes.map((x) => x.toString()).toList());
  }

  void updateInitDishLocalIndexesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    InitDishLocalIndexes[index] = updateFn(_InitDishLocalIndexes[index]);
    secureStorage.setStringList('ff_InitDishLocalIndexes',
        _InitDishLocalIndexes.map((x) => x.toString()).toList());
  }

  void insertAtIndexInInitDishLocalIndexes(int index, int value) {
    InitDishLocalIndexes.insert(index, value);
    secureStorage.setStringList('ff_InitDishLocalIndexes',
        _InitDishLocalIndexes.map((x) => x.toString()).toList());
  }

  /// 0
  int _InitDishlocalDisplayid = 0;
  int get InitDishlocalDisplayid => _InitDishlocalDisplayid;
  set InitDishlocalDisplayid(int value) {
    _InitDishlocalDisplayid = value;
    secureStorage.setInt('ff_InitDishlocalDisplayid', value);
  }

  void deleteInitDishlocalDisplayid() {
    secureStorage.delete(key: 'ff_InitDishlocalDisplayid');
  }

  String _LastRequest = '';
  String get LastRequest => _LastRequest;
  set LastRequest(String value) {
    _LastRequest = value;
    secureStorage.setString('ff_LastRequest', value);
  }

  void deleteLastRequest() {
    secureStorage.delete(key: 'ff_LastRequest');
  }

  String _APIKey =
      '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';
  String get APIKey => _APIKey;
  set APIKey(String value) {
    _APIKey = value;
    secureStorage.setString('ff_APIKey', value);
  }

  void deleteAPIKey() {
    secureStorage.delete(key: 'ff_APIKey');
  }

  DateTime? _defaultdate = DateTime.fromMillisecondsSinceEpoch(4102473600000);
  DateTime? get defaultdate => _defaultdate;
  set defaultdate(DateTime? value) {
    _defaultdate = value;
    value != null
        ? secureStorage.setInt('ff_defaultdate', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_defaultdate');
  }

  void deleteDefaultdate() {
    secureStorage.delete(key: 'ff_defaultdate');
  }

  bool _loadingDishes = false;
  bool get loadingDishes => _loadingDishes;
  set loadingDishes(bool value) {
    _loadingDishes = value;
  }

  String _LoadingDishStatus = 'Warming up...';
  String get LoadingDishStatus => _LoadingDishStatus;
  set LoadingDishStatus(String value) {
    _LoadingDishStatus = value;
  }

  String _PromptDishRec = '';
  String get PromptDishRec => _PromptDishRec;
  set PromptDishRec(String value) {
    _PromptDishRec = value;
    secureStorage.setString('ff_PromptDishRec', value);
  }

  void deletePromptDishRec() {
    secureStorage.delete(key: 'ff_PromptDishRec');
  }

  String _PromptDishRecDev = '';
  String get PromptDishRecDev => _PromptDishRecDev;
  set PromptDishRecDev(String value) {
    _PromptDishRecDev = value;
    secureStorage.setString('ff_PromptDishRecDev', value);
  }

  void deletePromptDishRecDev() {
    secureStorage.delete(key: 'ff_PromptDishRecDev');
  }

  dynamic _ResponseDishRec;
  dynamic get ResponseDishRec => _ResponseDishRec;
  set ResponseDishRec(dynamic value) {
    _ResponseDishRec = value;
    secureStorage.setString('ff_ResponseDishRec', jsonEncode(value));
  }

  void deleteResponseDishRec() {
    secureStorage.delete(key: 'ff_ResponseDishRec');
  }

  bool _FirstLaunch = true;
  bool get FirstLaunch => _FirstLaunch;
  set FirstLaunch(bool value) {
    _FirstLaunch = value;
    secureStorage.setBool('ff_FirstLaunch', value);
  }

  void deleteFirstLaunch() {
    secureStorage.delete(key: 'ff_FirstLaunch');
  }

  DateTime? _LastUseDateDishgen =
      DateTime.fromMillisecondsSinceEpoch(1748804400000);
  DateTime? get LastUseDateDishgen => _LastUseDateDishgen;
  set LastUseDateDishgen(DateTime? value) {
    _LastUseDateDishgen = value;
    value != null
        ? secureStorage.setInt(
            'ff_LastUseDateDishgen', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_LastUseDateDishgen');
  }

  void deleteLastUseDateDishgen() {
    secureStorage.delete(key: 'ff_LastUseDateDishgen');
  }

  int _UseCountDishgen = 0;
  int get UseCountDishgen => _UseCountDishgen;
  set UseCountDishgen(int value) {
    _UseCountDishgen = value;
    secureStorage.setInt('ff_UseCountDishgen', value);
  }

  void deleteUseCountDishgen() {
    secureStorage.delete(key: 'ff_UseCountDishgen');
  }

  DateTime? _LastUseDateScan =
      DateTime.fromMillisecondsSinceEpoch(1748804400000);
  DateTime? get LastUseDateScan => _LastUseDateScan;
  set LastUseDateScan(DateTime? value) {
    _LastUseDateScan = value;
    value != null
        ? secureStorage.setInt(
            'ff_LastUseDateScan', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_LastUseDateScan');
  }

  void deleteLastUseDateScan() {
    secureStorage.delete(key: 'ff_LastUseDateScan');
  }

  int _UseCountScan = 0;
  int get UseCountScan => _UseCountScan;
  set UseCountScan(int value) {
    _UseCountScan = value;
    secureStorage.setInt('ff_UseCountScan', value);
  }

  void deleteUseCountScan() {
    secureStorage.delete(key: 'ff_UseCountScan');
  }

  int _ApiDayLimit = 10;
  int get ApiDayLimit => _ApiDayLimit;
  set ApiDayLimit(int value) {
    _ApiDayLimit = value;
    secureStorage.setInt('ff_ApiDayLimit', value);
  }

  void deleteApiDayLimit() {
    secureStorage.delete(key: 'ff_ApiDayLimit');
  }

  String _UserPhoto =
      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  String get UserPhoto => _UserPhoto;
  set UserPhoto(String value) {
    _UserPhoto = value;
    secureStorage.setString('ff_UserPhoto', value);
  }

  void deleteUserPhoto() {
    secureStorage.delete(key: 'ff_UserPhoto');
  }

  String _UserName = '';
  String get UserName => _UserName;
  set UserName(String value) {
    _UserName = value;
    secureStorage.setString('ff_UserName', value);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_UserName');
  }

  bool _FlatInventoryView = true;
  bool get FlatInventoryView => _FlatInventoryView;
  set FlatInventoryView(bool value) {
    _FlatInventoryView = value;
    secureStorage.setBool('ff_FlatInventoryView', value);
  }

  void deleteFlatInventoryView() {
    secureStorage.delete(key: 'ff_FlatInventoryView');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
