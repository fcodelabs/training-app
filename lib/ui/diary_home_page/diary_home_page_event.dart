import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeScreenEvent {}

class SubmitNewButtonPressed extends DiaryHomeScreenEvent {}

class SubmitButtonPressed extends DiaryHomeScreenEvent {
  final String username;
  SubmitButtonPressed({required this.username});
}
