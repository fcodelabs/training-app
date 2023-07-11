import 'package:flutter/material.dart';

import '../../util/diary_entry.dart';

@immutable
class DiaryHomeState {
  final bool isInputVisible;
  final String textFieldValue;
  final String textFieldController;
  final String textAreaController;
  final List<DiaryEntry> diaryEntries;

  const DiaryHomeState({
    required this.isInputVisible,
    required this.textFieldValue,
    required this.textAreaController,
    required this.textFieldController,
    required this.diaryEntries,
  });

  static DiaryHomeState get initialState => const DiaryHomeState(
        isInputVisible: false,
        textFieldValue: '',
        textFieldController: '',
        textAreaController: '',
        diaryEntries: [],
      );

  DiaryHomeState clone({
    bool? isInputVisible,
    String? textFieldValue,
    String? textFieldController,
    String? textAreaController,
    List<DiaryEntry>? diaryEntries,
  }) {
    return DiaryHomeState(
      isInputVisible: isInputVisible ?? this.isInputVisible,
      textFieldValue: textFieldValue ?? this.textFieldValue,
      textFieldController: textFieldController ?? this.textFieldController,
      textAreaController: textAreaController ?? this.textAreaController,
      diaryEntries: diaryEntries ?? this.diaryEntries,
    );
  }
}
