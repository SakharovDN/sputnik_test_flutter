import 'package:flutter/material.dart';
import 'package:sputnik_test_flutter/domain/data_providers/data_provider.dart';
import 'package:sputnik_test_flutter/domain/entity/user.dart';

class ProfileViewModel extends ChangeNotifier {
  final _dataProvider = DataProvider();

  User? _user;

  User? get user => _user;

  ProfileViewModel() {
    _initAsync();
  }

  void _initAsync() async {
    _user = await _dataProvider.getUser();

    notifyListeners();
  }
}
