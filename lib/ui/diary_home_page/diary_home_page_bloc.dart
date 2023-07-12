import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import '../widgets/diary_card/diary_card.dart';

class DiaryHomePageBloc extends Bloc<DiaryHomePageEvent, DiaryHomePageState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection('diary');

  DiaryHomePageBloc() : super(DiaryHomePageState.initialState) {
    on<SubmitDiaryCardEvent>(_addDiaryCard);
    on<SetAddNewDiaryEvent>(_setAddNewDiary);
  }

  Future<void> _addDiaryCard(
      SubmitDiaryCardEvent event, Emitter<DiaryHomePageState> emit) async {
    emit(state.clone(
      diaryList: [
        ...state.diaryList,
        DiaryCard(
          title: event.title,
          description: event.description,
          username: event.username,
        ),
      ],
      addNewDiary: false,
    ));
    await diaryCollection.add({
      'title': event.title,
      'description': event.description,
      'username': event.username,
    });
  }

  void _setAddNewDiary(
      SetAddNewDiaryEvent event, Emitter<DiaryHomePageState> emit) {
    emit(state.clone(addNewDiary: !state.addNewDiary));
  }
}
