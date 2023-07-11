import 'package:flutter/material.dart';

@immutable
abstract class SignInPageEvent {}

class ContinueEvent extends SignInPageEvent {
  ContinueEvent();
}

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