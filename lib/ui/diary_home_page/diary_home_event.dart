import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeEvent {}

class InputVisibleEvent extends DiaryHomeEvent {
  InputVisibleEvent();
}

