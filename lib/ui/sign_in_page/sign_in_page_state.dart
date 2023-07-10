import 'package:flutter/material.dart';

@immutable
class SignInPageState {
  final bool isEnable;
  final String textFieldValue;

  const SignInPageState({
    required this.isEnable,
    required this.textFieldValue,
  });

  static SignInPageState get initialState => const SignInPageState(
        isEnable: false,
        textFieldValue: "",
      );

  SignInPageState clone({
    bool? isEnable,
    String? textFieldValue,
  }) {
    return SignInPageState(
      isEnable: isEnable ?? this.isEnable,
      textFieldValue: textFieldValue ?? this.textFieldValue,
    );
  }
}
