import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/core/services/user_database_service.dart';
import 'package:my_store/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  Future<void> register(String username, String password) async {
    try{
      final user = User(username: username, password: password);
      await UserDatabaseService().insertUser(user);
      state = user;
    }catch (e) {

    log('Error register users: $e');
    }
  }

  Future<bool> login(String username, String password) async {
    final user = await UserDatabaseService().getUser(username, password);
    if (user != null) {
      state = user;
      return true;
    }
    return false;
  }

  void logout() => state = null;
}
