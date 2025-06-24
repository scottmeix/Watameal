// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryItemStruct extends BaseStruct {
  InventoryItemStruct({
    String? itemName,
    int? quantity,
    String? unit,
    DateTime? lastUpdated,
    String? catagory,
    DateTime? expiration,
    bool? frozen,
  })  : _itemName = itemName,
        _quantity = quantity,
        _unit = unit,
        _lastUpdated = lastUpdated,
        _catagory = catagory,
        _expiration = expiration,
        _frozen = frozen;

  // "ItemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;

  bool hasItemName() => _itemName != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "Unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "LastUpdated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  set lastUpdated(DateTime? val) => _lastUpdated = val;

  bool hasLastUpdated() => _lastUpdated != null;

  // "Catagory" field.
  String? _catagory;
  String get catagory => _catagory ?? '';
  set catagory(String? val) => _catagory = val;

  bool hasCatagory() => _catagory != null;

  // "Expiration" field.
  DateTime? _expiration;
  DateTime? get expiration => _expiration;
  set expiration(DateTime? val) => _expiration = val;

  bool hasExpiration() => _expiration != null;

  // "Frozen" field.
  bool? _frozen;
  bool get frozen => _frozen ?? false;
  set frozen(bool? val) => _frozen = val;

  bool hasFrozen() => _frozen != null;

  static InventoryItemStruct fromMap(Map<String, dynamic> data) =>
      InventoryItemStruct(
        itemName: data['ItemName'] as String?,
        quantity: castToType<int>(data['Quantity']),
        unit: data['Unit'] as String?,
        lastUpdated: data['LastUpdated'] as DateTime?,
        catagory: data['Catagory'] as String?,
        expiration: data['Expiration'] as DateTime?,
        frozen: data['Frozen'] as bool?,
      );

  static InventoryItemStruct? maybeFromMap(dynamic data) => data is Map
      ? InventoryItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ItemName': _itemName,
        'Quantity': _quantity,
        'Unit': _unit,
        'LastUpdated': _lastUpdated,
        'Catagory': _catagory,
        'Expiration': _expiration,
        'Frozen': _frozen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ItemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'LastUpdated': serializeParam(
          _lastUpdated,
          ParamType.DateTime,
        ),
        'Catagory': serializeParam(
          _catagory,
          ParamType.String,
        ),
        'Expiration': serializeParam(
          _expiration,
          ParamType.DateTime,
        ),
        'Frozen': serializeParam(
          _frozen,
          ParamType.bool,
        ),
      }.withoutNulls;

  static InventoryItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      InventoryItemStruct(
        itemName: deserializeParam(
          data['ItemName'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        unit: deserializeParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
        lastUpdated: deserializeParam(
          data['LastUpdated'],
          ParamType.DateTime,
          false,
        ),
        catagory: deserializeParam(
          data['Catagory'],
          ParamType.String,
          false,
        ),
        expiration: deserializeParam(
          data['Expiration'],
          ParamType.DateTime,
          false,
        ),
        frozen: deserializeParam(
          data['Frozen'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'InventoryItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InventoryItemStruct &&
        itemName == other.itemName &&
        quantity == other.quantity &&
        unit == other.unit &&
        lastUpdated == other.lastUpdated &&
        catagory == other.catagory &&
        expiration == other.expiration &&
        frozen == other.frozen;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [itemName, quantity, unit, lastUpdated, catagory, expiration, frozen]);
}

InventoryItemStruct createInventoryItemStruct({
  String? itemName,
  int? quantity,
  String? unit,
  DateTime? lastUpdated,
  String? catagory,
  DateTime? expiration,
  bool? frozen,
}) =>
    InventoryItemStruct(
      itemName: itemName,
      quantity: quantity,
      unit: unit,
      lastUpdated: lastUpdated,
      catagory: catagory,
      expiration: expiration,
      frozen: frozen,
    );
