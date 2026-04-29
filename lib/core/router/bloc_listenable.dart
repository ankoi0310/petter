import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenable<S> extends ChangeNotifier {
  BlocListenable(BlocBase<S> bloc) : _bloc = bloc {
    _subscription = bloc.stream.listen((_) => notifyListeners());
  }

  final BlocBase<S> _bloc;
  StreamSubscription<S>? _subscription;

  S get state => _bloc.state;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    super.dispose();
  }
}
