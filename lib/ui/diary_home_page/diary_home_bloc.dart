import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../db/model/diary_entry_model.dart';
import '../../db/repo/diary_repository .dart';
import '../../util/diary_entry.dart';
import 'diary_home_event.dart';
import 'diary_home_state.dart';

class DiaryHomeBloc extends Bloc<DiaryHomeEvent, DiaryHomeState> {
  final DiaryRepository _diaryRepository = DiaryRepository();

  DiaryHomeBloc() : super(DiaryHomeState.initialState) {
    on<InputVisibleEvent>(_inputVisibleEvent);
    on<SubmitDataEvent>(_submitDataEvent);
    on<GetAllEvent>(_getAllDiary);
    DiaryRepository().diaryCollection.snapshots().listen((snapshot) {
      add(GetAllEvent());
    });
  }

  Future<void> _submitDataEvent(
      SubmitDataEvent event, Emitter<DiaryHomeState> emit) async {
    String textFieldInput = event.textFieldValueTitle.trim();
    String textAreaInput = event.textAreaValue.trim();

    final newEntry = DiaryEntryModel(
      title: textFieldInput,
      username: event.textFieldValue,
      description: textAreaInput,
    );
    await _diaryRepository.saveDiaryEntry(newEntry);
    emit(
        state.clone(diaryEntries: await _getAllEvent(), isInputVisible: false));
  }

  Future<List<DiaryEntry>> _getAllEvent() async {
    return _diaryRepository.getAllDiaryEntries();
  }

  Future<void> _getAllDiary(
      GetAllEvent event, Emitter<DiaryHomeState> emit) async {
    emit(
      state.clone(
        diaryEntries: await _getAllEvent(),
      ),
    );
  }

  Future<void> _inputVisibleEvent(
      InputVisibleEvent event, Emitter<DiaryHomeState> emit) async {
    emit(state.clone(isInputVisible: !state.isInputVisible));
  }
}
