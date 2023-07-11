import 'package:flutter/material.dart';

@immutable
class DiaryHomeState {
  final bool isInputVisible;

  const DiaryHomeState({
    required this.isInputVisible,
  });

  static DiaryHomeState get initialState => const DiaryHomeState(
        isInputVisible: false,
      );

  DiaryHomeState clone({
    bool? isInputVisible,
  }) {
    return DiaryHomeState(
      isInputVisible: isInputVisible ?? this.isInputVisible,
    );
  }
}
