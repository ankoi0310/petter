import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._repository) {
    _subscription = _repository.isAuthenticated.listen((isAuth) {
      if (_isAuthenticated != isAuth) {
        _isAuthenticated = isAuth;
        notifyListeners();
      }
    });
  }

  final AuthRepository _repository;
  StreamSubscription<bool>? _subscription;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    super.dispose();
  }
}
