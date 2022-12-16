// ignore_for_file: overridden_fields, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Enter username and password';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMessage = 'Wrong username and password';
    }
    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Unknown error, please try again';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushNamed('/main_screen'));
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider(this.model, {super.key, required this.child})
      : super(
          child: child,
        );

  @override
  final Widget child;

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
