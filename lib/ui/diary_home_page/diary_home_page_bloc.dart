import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';

class DiaryHomeScreenBloc
    extends Bloc<DiaryHomeScreenEvent, DiaryHomeScreenState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DiaryHomeScreenBloc() : super(DiaryHomeScreenState.initialState) {
    on<SubmitNewButtonPressed>(_onSubmitNewButtonPressed);
    on<SubmitButtonPressed>(_onSubmitButtonPressed);
  }

  void _onSubmitNewButtonPressed(
    SubmitNewButtonPressed event,
    Emitter<DiaryHomeScreenState> emit,
  ) {
    emit(state.clone(isSubmitting: true));
  }

  void _onSubmitButtonPressed(
    SubmitButtonPressed event,
    Emitter<DiaryHomeScreenState> emit,
  ) {
    final title = state.titleController.text.trim();
    final description = state.descriptionController.text.trim();
    final username = event.username.trim();
    

print('title name user: $username');
    if (title.isNotEmpty && description.isNotEmpty) {
      final newCardEntry = DiaryCardEntry(
          title: title, description: description, username: username);
      emit(state.clone(
        entries: [...state.entries, newCardEntry],
        isSubmitting: false,
        username: username,
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
      ));
    }
  }
}
