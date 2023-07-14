import 'package:flutter/material.dart';

@immutable
class LoginPageState {
  final bool isEnable;
  final String name;

  const LoginPageState({
    required this.isEnable,
    required this.name,
  });

  static LoginPageState get initialState => const LoginPageState(
        isEnable: false,
        name: '',
      );

  LoginPageState clone({
    bool? isEnable,
    String? name,
  }) {
    return LoginPageState(
      isEnable: isEnable ?? this.isEnable,
      name: name ?? this.name,
    );
  }
}
