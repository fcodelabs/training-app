import 'package:flutter/material.dart';

@immutable
abstract class LoginPageEvents {}

class BindChangeClickEvent extends LoginPageEvents {
  final String value;

  BindChangeClickEvent({required this.value});
}

class SetRandomTempNameEvent extends LoginPageEvents {
  SetRandomTempNameEvent();
}
