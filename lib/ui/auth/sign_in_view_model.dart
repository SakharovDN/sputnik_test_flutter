import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sputnik_test_flutter/domain/data_providers/data_provider.dart';
import 'package:sputnik_test_flutter/domain/exceptions/api_exception.dart';
import 'package:sputnik_test_flutter/domain/services/user_service.dart';

class SignInViewModel extends ChangeNotifier {
  final BuildContext context;
  final _authService = UserService();
  final _dataProvider = DataProvider();

  String? _nickname;
  String? _errorMessage;
  bool _signingInInProgress = false;

  bool get canStartSigningIn => _nickname != null && _nickname!.isNotEmpty;
  bool get signingInInProgress => _signingInInProgress;
  String? get errorMessage => _errorMessage;

  SignInViewModel({required this.context});

  Future<bool> onSearchPressed() async {
    bool success = false;
    if (!canStartSigningIn || signingInInProgress) {
      return success;
    }

    _errorMessage = null;
    _signingInInProgress = true;
    notifyListeners();
    try {
      final user = await _authService.search(_nickname!);
      _dataProvider.setUser(user);
      success = true;
    } on ApiException catch (ex) {
      switch (ex.type) {
        case ApiExceptionType.userNotFound:
          _errorMessage = AppLocalizations.of(context)!.userNotFound;
          break;
        case ApiExceptionType.network:
          _errorMessage = AppLocalizations.of(context)!.connectionLostHint;
          break;
        case ApiExceptionType.other:
          _errorMessage = AppLocalizations.of(context)!.oops;
          break;
      }
    }

    _signingInInProgress = false;
    notifyListeners();
    return success;
  }

  void onNicknameChanged(String value) {
    _nickname = value;
    notifyListeners();
  }
}
