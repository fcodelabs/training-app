import 'package:flutter/material.dart';

@immutable
class DiaryHomeScreenState {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final List<DiaryCardEntry> entries;
  final bool isSubmitting;
  final String username;

  const DiaryHomeScreenState({
    required this.titleController,
    required this.descriptionController,
    required this.entries,
    required this.isSubmitting,
    required this.username,
  });

  static DiaryHomeScreenState get initialState => DiaryHomeScreenState(
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
        entries: const [],
        isSubmitting: false,
        username: '',
      );

  DiaryHomeScreenState clone({
    TextEditingController? titleController,
    TextEditingController? descriptionController,
    List<DiaryCardEntry>? entries,
    bool? isSubmitting,
    String? username,
  }) {
    return DiaryHomeScreenState(
      titleController: titleController ?? this.titleController,
      descriptionController:
          descriptionController ?? this.descriptionController,
      entries: entries ?? this.entries,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      username: username ?? this.username,
    );
  }
}

class DiaryCardEntry {
  final String title;
  final String description;
  final String username;

  DiaryCardEntry({
    required this.title,
    required this.description,
    required this.username,
  });
}
