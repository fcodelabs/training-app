import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../db/model/diary_entry.dart';
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
  }

  FutureOr<void> _submitDataEvent(
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

  FutureOr<List<DiaryEntry>> _getAllEvent() async {
    List<DiaryEntryModel> getAll = await _diaryRepository.getAllDiaryEntries();
    return getAll
        .map(
          (e) => DiaryEntry(
            title: e.title,
            username: e.username,
            description: e.description,
          ),
        )
        .toList();
  }

  FutureOr<void> _getAllDiary(
      GetAllEvent event, Emitter<DiaryHomeState> emit) async {
    emit(
      state.clone(
        diaryEntries: await _getAllEvent(),
      ),
    );
  }

  FutureOr<void> _inputVisibleEvent(
      InputVisibleEvent event, Emitter<DiaryHomeState> emit) {
    emit(state.clone(isInputVisible: !state.isInputVisible));
  }
}
