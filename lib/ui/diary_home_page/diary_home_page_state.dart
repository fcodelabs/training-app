import 'package:flutter/material.dart';

@immutable
class DiaryHomeScreenState {
  //Properties
  final TextEditingController title;
  final TextEditingController description;
  final List<DiaryCardEntry> entries;
  final bool isSubmitting;
  final String username;

  //Constructor
  const DiaryHomeScreenState({
    required this.title,
    required this.description,
    required this.entries,
    required this.isSubmitting,
    required this.username,
  });

  //A static getter method initialState is defined,
  static DiaryHomeScreenState get initialState => DiaryHomeScreenState(
        title: TextEditingController(),
        description: TextEditingController(),
        entries: const [],
        isSubmitting: false,
        username: '',
      );

// The clone method is defined to create a copy of the current DiaryHomeScreenState instance with some optional changes It takes in optional parameters title, description, entries, isSubmitting, and username and returns a new instance of DiaryHomeScreenState. If any of the parameters are provided, they are used to create new instances of the corresponding properties; otherwise, the existing properties are used.
  DiaryHomeScreenState clone({
    TextEditingController? title,
    TextEditingController? description,
    List<DiaryCardEntry>? entries,
    bool? isSubmitting,
    String? username,
  }) {
    return DiaryHomeScreenState(
      title: title ?? this.title,
      description: description ?? this.description,
      entries: entries ?? this.entries,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      username: username ?? this.username,
    );
  }
}

// The DiaryCardEntry class is defined to represent a single diary card entry. It has three properties: title, description, and username. The constructor takes in the required parameters title, description, and username and assigns them to the corresponding properties.
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
