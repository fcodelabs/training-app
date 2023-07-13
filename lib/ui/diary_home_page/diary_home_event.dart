import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeEvent {}

class InputVisibleEvent extends DiaryHomeEvent {
  InputVisibleEvent();
}

class SubmitDataEvent extends DiaryHomeEvent {
  final String textFieldValue;
  final String textAreaValue;
  final String textAreaController;

  SubmitDataEvent(
      {required this.textFieldValue,
      required this.textAreaValue,
      required this.textAreaController});

  void clear() {}

  void toggleInputVisibility() {}
}
