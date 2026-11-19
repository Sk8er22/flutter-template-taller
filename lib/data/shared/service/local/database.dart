import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_template/data/article/service/local/model/article_db_model.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Articles])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  // [directory] is only null on web, where the database is kept in the
  // browser storage by the drift worker.
  static AppDatabase init({required String? directory}) {
    return AppDatabase(
      driftDatabase(
        name: 'app_database',
        native: DriftNativeOptions(
          databaseDirectory: () async => directory!,
        ),
        // Both files live in web/ and must come from the drift GitHub release
        // that matches the drift version in pubspec.lock.
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.js'),
        ),
      ),
    );
  }

  // FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int fastHash(String string) {
    // On native this equals the 64-bit literal 0xcbf29ce484222325, which the
    // web compiler rejects because JavaScript numbers cannot represent it.
    var hash = (0xcbf29ce4 << 32) | 0x84222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
