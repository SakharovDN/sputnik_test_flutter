import 'package:flutter/material.dart';
import 'package:sputnik_test_flutter/domain/data_providers/user_data_provider.dart';
import 'package:sputnik_test_flutter/domain/entity/following.dart';
import 'package:sputnik_test_flutter/domain/entity/repo.dart';
import 'package:sputnik_test_flutter/domain/entity/user.dart';
import 'package:sputnik_test_flutter/domain/services/user_service.dart';

class HomeViewModel extends ChangeNotifier {
  final _userDataProvider = UserDataProvider();
  final _userService = UserService();

  User? _user;
  List<Following>? _followings;
  List<Repo>? _repos;

  List<Following>? get followings => _followings;
  List<Repo>? get repos => _repos;
  User? get user => _user;

  HomeViewModel() {
    _initAsync();
  }

  void _initAsync() async {
    _user = await _userDataProvider.getUser();
    _followings = await _userService.getFollowings(_user!.login);
    _repos = await _userService.getRepos(_user!.login);
    notifyListeners();
  }
}
