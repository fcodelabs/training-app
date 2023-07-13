import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeEvent {}

class InputVisibleEvent extends DiaryHomeEvent {
  InputVisibleEvent();
}

class SubmitDataEvent extends DiaryHomeEvent {
  final String textFieldValue;
  final String textFieldValueTitle;
  final String textAreaValue;

  SubmitDataEvent(
      {required this.textFieldValue,
      required this.textFieldValueTitle,
      required this.textAreaValue});

  void clear() {}

  void toggleInputVisibility() {}
}
