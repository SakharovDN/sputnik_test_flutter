import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:sputnik_test_flutter/domain/entity/user.dart';
import 'package:sputnik_test_flutter/domain/exceptions/api_exception.dart';

class AuthService {
  Future<User> signIn(String nickname) async {
    try {
      final url = Uri.parse('https://api.github.com/users/$nickname');
      final response = await get(
        url,
        headers: {
          'Accept': 'application/vnd.github+json',
        },
      ).timeout(const Duration(seconds: 5));

      switch (response.statusCode) {
        case 404:
          throw ApiException(ApiExceptionType.userNotFound);
      }

      final json = jsonDecode(response.body);
      final user = User.fromJson(json);

      return user;
    } on SocketException {
      throw ApiException(ApiExceptionType.network);
    } on TimeoutException {
      throw ApiException(ApiExceptionType.other);
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(ApiExceptionType.other);
    }
  }
}
