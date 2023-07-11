import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';

class DiaryHomePageBloc extends Bloc<DiaryHomePageEvent, DiaryHomePageState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DiaryHomePageBloc() : super(DiaryHomePageState.initialState) {
    on<SubmitDiaryCardEvent>(_addDiaryCard);
    on<SetAddNewDiaryEvent>(_setAddNewDiary);
  }

  void _addDiaryCard(
      SubmitDiaryCardEvent event, Emitter<DiaryHomePageState> emit) {
    emit(state.clone(
      diaryList: [
        ...state.diaryList,
        DiaryCardProvider(
          title: event.title,
          description: event.description,
          username: event.username,
        ),
      ],
    ));
  }

  void _setAddNewDiary(
      SetAddNewDiaryEvent event, Emitter<DiaryHomePageState> emit) {
    emit(state.clone(addNewDiary: !state.addNewDiary));
  }
}
