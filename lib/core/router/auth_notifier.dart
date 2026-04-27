import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._repository) {
    _subscription = _repository.user.listen((user) {
      if (_user != user) {
        _user = user;
        notifyListeners();
      }
    });
  }

  final AuthRepository _repository;
  StreamSubscription<User?>? _subscription;

  User? _user;

  bool get isAuthenticated => _user != null;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    super.dispose();
  }
}
