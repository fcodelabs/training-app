import 'package:flutter/material.dart';

@immutable
abstract class DiaryCardEvent {}

class ToggleShowMore extends DiaryCardEvent {
  final bool showMore;

  ToggleShowMore({
    required this.showMore,
  });
}
