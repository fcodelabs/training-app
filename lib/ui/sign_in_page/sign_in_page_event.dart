import 'package:flutter/material.dart';

@immutable
abstract class SignInPageEvent {}

class SetTextFieldValue extends SignInPageEvent {
  final String textFieldValue;

  SetTextFieldValue({required this.textFieldValue});
}

class GenerateRandomNameEvent extends SignInPageEvent {
  GenerateRandomNameEvent();
}

class ChangeValueEvent extends SignInPageEvent {
  ChangeValueEvent();
}
