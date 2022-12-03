import 'package:flutter/cupertino.dart';
import 'package:sputnik_test_flutter/domain/data_providers/data_provider.dart';
import 'package:sputnik_test_flutter/ui/routes/router.dart';

class LoaderViewModel {
  final BuildContext context;
  final _dataProvider = DataProvider();

  LoaderViewModel(this.context) {
    _initAsync();
  }

  Future<void> _initAsync() async {
    await _isFirstLaunch().then(Navigator.of(context).pushReplacementNamed);
  }

  Future<String> _isFirstLaunch() async {
    final isFisrtLaunch = await _dataProvider.getFirstLaunch();
    if (isFisrtLaunch == null || isFisrtLaunch) {
      _dataProvider.setFirstLaunch(false);
      return RouteNames.onboarding;
    }
    return RouteNames.signIn;
  }
}
