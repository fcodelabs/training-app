import 'package:flutter/material.dart';

@immutable
abstract class DiaryCardEvent {}

class ToggleShowMoreEvent extends DiaryCardEvent {
  ToggleShowMoreEvent();
}
