import 'package:my_store/core/services/database_service_base.dart';
import 'package:my_store/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDatabaseService extends DatabaseServiceBase {
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
}
