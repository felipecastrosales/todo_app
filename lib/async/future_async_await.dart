import 'package:flutter/material.dart';

Future<void> main() async {
  debugPrint('Hello, World!');
  bool success = await helper();
  debugPrint('success() - $success');
  debugPrint('Bye, World!');
}

Future<bool> helper() async {
  debugPrint('helper()');
  String user = await reqUser();
  debugPrint('find user() - $user');
  try {
    bool success = await autenticate(user);
    debugPrint('main() - $success');
    return success;
  } catch (error) {
    debugPrint('main() - $error');
    return false;
  }
}

Future<String> reqUser() async {
  debugPrint('reqUser()');
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      debugPrint('reqUser() - Future');
      return 'Felipe';
    },
  );
}

Future<bool> autenticate(String user) async {
  debugPrint('autenticate()');
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      if (user == 'Felipe') {
        return true;
      }
      throw InvalidUser('Invalid user: $user');
    },
  );
}

class InvalidUser implements Exception {
  final String message;
  InvalidUser(this.message);
}
