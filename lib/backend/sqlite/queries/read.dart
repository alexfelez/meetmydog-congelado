import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN OBETENER PERSONAS
Future<List<ObetenerPersonasRow>> performObetenerPersonas(
  Database database,
) {
  final query = '''
Select PersonId, LastName form Persons
''';
  return _readQuery(database, query, (d) => ObetenerPersonasRow(d));
}

class ObetenerPersonasRow extends SqliteRow {
  ObetenerPersonasRow(Map<String, dynamic> data) : super(data);

  int? get personId => data['PersonId'] as int?;
  String? get lastName => data['LastName'] as String?;
}

/// END OBETENER PERSONAS
