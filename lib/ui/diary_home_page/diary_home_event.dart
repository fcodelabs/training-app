import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeEvent {}

class InputVisibleEvent extends DiaryHomeEvent {
  InputVisibleEvent();
}

class SubmitDataEvent extends DiaryHomeEvent {
  final String textFieldValue;
  final String textFieldController;
  final String textAreaController;

  SubmitDataEvent(
      {required this.textFieldValue,
      required this.textFieldController,
      required this.textAreaController});

  void clear() {}

  void toggleInputVisibility() {}
}
