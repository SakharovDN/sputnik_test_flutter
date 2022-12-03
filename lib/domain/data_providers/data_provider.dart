import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sputnik_test_flutter/domain/entity/user.dart';

abstract class _Keys {
  static const user = 'user';
  static const firstLaunch = 'firstLaunch';
}

class DataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<User?> getUser() async {
    String? json = await _secureStorage.read(key: _Keys.user);
    if (json == null) return null;
    return User.fromJson(jsonDecode(json));
  }

  Future<void> setUser(User user) {
    return _secureStorage.write(key: _Keys.user, value: jsonEncode(user));
  }

  Future<void> removeUser() {
    return _secureStorage.delete(key: _Keys.user);
  }

  Future<bool?> getFirstLaunch() async {
    String? isFisrtLaunch = await _secureStorage.read(key: _Keys.firstLaunch);
    if (isFisrtLaunch != null) {
      return isFisrtLaunch.toLowerCase() == 'true';
    }
    return null;
  }

  Future<void> setFirstLaunch(bool firstLaunch) {
    return _secureStorage.write(key: _Keys.firstLaunch, value: firstLaunch.toString());
  }

  
}
