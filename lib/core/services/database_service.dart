import 'package:my_store/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:my_store/models/product.dart';

class DatabaseService {
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

  //** Users **//
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> getUser(String username, String password) async {
    final db = await database;
    final data = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (data.isNotEmpty) {
      return User.fromMap(data.first);
    }
    return null;
  }

  //** Products **//
  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final data = await db.query('products');
    return List.generate(
      data.length,
      (i) => Product.fromMap(data[i]),
    );
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

// Future<void> clearDatabase() async {
//   final db = await database;
//   await db.transaction((txn) async {
//     await txn.delete('products');
//   });
// }
}
