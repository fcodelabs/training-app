import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/diary_entry.dart';
import 'diary_home_event.dart';
import 'diary_home_state.dart';

class DiaryHomeBloc extends Bloc<DiaryHomeEvent, DiaryHomeState> {
  DiaryHomeBloc() : super(DiaryHomeState.initialState) {
    on<InputVisibleEvent>(_inputVisibleEvent);
    on<SubmitDataEvent>(_submitDataEvent);
  }

  FutureOr<void> _inputVisibleEvent(
      InputVisibleEvent event, Emitter<DiaryHomeState> emit) {
    emit(state.clone(isInputVisible: !state.isInputVisible));
  }

  FutureOr<void> _submitDataEvent(
      SubmitDataEvent event, Emitter<DiaryHomeState> emit) {
    String textFieldInput = event.textFieldController.trim();
    String textAreaInput = event.textAreaController.trim();

    DiaryEntry newEntry = DiaryEntry(
      title: textFieldInput,
      username: event.textFieldValue,
      description: textAreaInput,
    );
    List<DiaryEntry> updatedEntries = [...state.diaryEntries, newEntry];
    emit(state.clone(diaryEntries: updatedEntries, isInputVisible: false));
  }
}
