import 'package:my_store/core/services/database_service_base.dart';
import 'package:my_store/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseService extends DatabaseServiceBase {
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
}