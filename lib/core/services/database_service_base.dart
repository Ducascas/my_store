import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServiceBase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users (
        username TEXT PRIMARY KEY,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Products (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        imageUrl TEXT,
        isFavorite INTEGER
      )
    ''');
  }

// Future<void> clearDatabase() async {
//   final db = await database;
//   await db.transaction((txn) async {
//     await txn.delete('products');
//   });
// }
}
