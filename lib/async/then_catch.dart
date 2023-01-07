import 'package:flutter/material.dart';

void main() {
  debugPrint('Hello, World!');
  reqUser().then(
    (user) {
      debugPrint('reqUser()');
      debugPrint(user);
      debugPrint('findUser() - $user');
      autenticate(user).then((user) {
        debugPrint('autenticate()');
      });
      debugPrint('findUser() - $user');
    },
  ).catchError((error) {
    debugPrint('findUser() - $error');
  });
  debugPrint('Bye, World!');
}

autenticate(String user) {
  debugPrint('autenticate()');
}

reqUser() {
  debugPrint('reqUser()');
  // Future.delayed(const Duration(seconds: 2), () {
  //   debugPrint('reqUser() - Future');
  //   return 'reqUser() - Future';
  // }).then((value) {
  //   debugPrint('reqUser() - Future.then()');
  //   debugPrint(value);
  // });
}
