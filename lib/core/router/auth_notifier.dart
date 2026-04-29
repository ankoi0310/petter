import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/user/domain/entities/user.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._repository) {
    _subscription = _repository.user.listen((user) {
      if (_user != user) {
        _user = user;
        _isInitialized = true;
        notifyListeners();
      }
    });
  }

  final AuthRepository _repository;
  StreamSubscription<User?>? _subscription;

  User? _user;
  bool _isInitialized = false;

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  bool get isInitialized => _isInitialized;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    super.dispose();
  }
}
