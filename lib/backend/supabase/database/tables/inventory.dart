import '../database.dart';

class InventoryTable extends SupabaseTable<InventoryRow> {
  @override
  String get tableName => 'inventory';

  @override
  InventoryRow createRow(Map<String, dynamic> data) => InventoryRow(data);
}

class InventoryRow extends SupabaseDataRow {
  InventoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InventoryTable();

  int get itemId => getField<int>('item_id')!;
  set itemId(int value) => setField<int>('item_id', value);

  String get itemName => getField<String>('item_name')!;
  set itemName(String value) => setField<String>('item_name', value);

  double? get quantity => getField<double>('quantity');
  set quantity(double? value) => setField<double>('quantity', value);

  String? get unit => getField<String>('unit');
  set unit(String? value) => setField<String>('unit', value);

  DateTime? get expiration => getField<DateTime>('expiration');
  set expiration(DateTime? value) => setField<DateTime>('expiration', value);

  String? get frozen => getField<String>('frozen');
  set frozen(String? value) => setField<String>('frozen', value);

  String? get catagory => getField<String>('catagory');
  set catagory(String? value) => setField<String>('catagory', value);

  DateTime? get lastUpdated => getField<DateTime>('last_updated');
  set lastUpdated(DateTime? value) => setField<DateTime>('last_updated', value);
}
