import 'package:flutter/material.dart';

import '../../util/diary_entry.dart';

@immutable
class DiaryHomeState {
  final bool isInputVisible;
  final String textFieldValue;
  final String textFieldValueTitle;
  final String textAreaValue;
  final List<DiaryEntry> diaryEntries;

  const DiaryHomeState({
    required this.isInputVisible,
    required this.textFieldValue,
    required this.textFieldValueTitle,
    required this.textAreaValue,
    required this.diaryEntries,
  });

  static DiaryHomeState get initialState => const DiaryHomeState(
        isInputVisible: false,
        textFieldValue: '',
        textFieldValueTitle: '',
        textAreaValue: '',
        diaryEntries: [],
      );

  DiaryHomeState clone({
    bool? isInputVisible,
    String? textFieldValue,
    String? textFieldValueTitle,
    String? textAreaValue,
    List<DiaryEntry>? diaryEntries,
  }) {
    return DiaryHomeState(
      isInputVisible: isInputVisible ?? this.isInputVisible,
      textFieldValue: textFieldValue ?? this.textFieldValue,
      textFieldValueTitle: textFieldValueTitle ?? this.textFieldValueTitle,
      textAreaValue: textAreaValue ?? this.textAreaValue,
      diaryEntries: diaryEntries ?? this.diaryEntries,
    );
  }
}
