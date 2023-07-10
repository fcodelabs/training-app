import 'package:flutter/material.dart';

@immutable
abstract class SignInPageEvent {}

class ContinueToHomePageEvent extends SignInPageEvent {
  final String name;

  ContinueToHomePageEvent({required this.name});
}

class SetRandomNicknameEvent extends SignInPageEvent {
  SetRandomNicknameEvent();
}
