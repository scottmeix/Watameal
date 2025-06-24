import '../database.dart';

class TestUserTable extends SupabaseTable<TestUserRow> {
  @override
  String get tableName => 'TestUser';

  @override
  TestUserRow createRow(Map<String, dynamic> data) => TestUserRow(data);
}

class TestUserRow extends SupabaseDataRow {
  TestUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestUserTable();

  String get userid => getField<String>('userid')!;
  set userid(String value) => setField<String>('userid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
