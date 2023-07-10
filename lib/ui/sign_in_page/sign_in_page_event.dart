import 'package:flutter/material.dart';

@immutable
abstract class SignInPageEvent {}

class ContinueToHomePageEvent extends SignInPageEvent {
  final String name;
  final BuildContext context;

  ContinueToHomePageEvent({required this.name, required this.context});
}

class SetRandomNicknameEvent extends SignInPageEvent {
  SetRandomNicknameEvent();
}

class SetNameEvent extends SignInPageEvent {
  final String name;

  SetNameEvent({required this.name});
}
