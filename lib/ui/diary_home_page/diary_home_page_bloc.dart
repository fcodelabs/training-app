import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/model/diary.dart';
import 'package:training_app/service/diary_service.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';

class DiaryHomePageBloc extends Bloc<DiaryHomePageEvent, DiaryHomePageState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection('diary');

  DiaryHomePageBloc() : super(DiaryHomePageState.initialState) {
    on<SubmitDiaryCardEvent>(_addDiaryCard);
    on<SetAddNewDiaryEvent>(_setAddNewDiary);
    on<GetAllDiaryCardsEvent>(_getAllDiaryCardsEvent);
  }

  Future<void> _addDiaryCard(
      SubmitDiaryCardEvent event, Emitter<DiaryHomePageState> emit) async {
    emit(
      state.clone(
        diaryList: [
          ...state.diaryList,
          Diary(
            title: event.title,
            description: event.description,
            username: event.username,
          ),
        ],
      ),
    );
    await DiaryService()
        .addDiaryCard(
          event.title,
          event.description,
          event.username,
        )
        .then(
          (value) async => {
            emit(
              state.clone(
                  diaryList: await _getAllDiaryCards(), addNewDiary: false),
            )
          },
        )
        .catchError((error) => error);
  }

  void _setAddNewDiary(
      SetAddNewDiaryEvent event, Emitter<DiaryHomePageState> emit) {
    emit(
      state.clone(
        addNewDiary: !state.addNewDiary,
      ),
    );
  }

  void _getAllDiaryCardsEvent(
      GetAllDiaryCardsEvent event, Emitter<DiaryHomePageState> emit) async {
    emit(state.clone(diaryList: await _getAllDiaryCards()));
  }

  Future<List<Diary>> _getAllDiaryCards() async {
    QuerySnapshot querySnapshot = await diaryCollection.get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    return docs
        .map(
          (e) => Diary(
            title: e['title'],
            description: e['description'],
            username: e['username'],
          ),
        )
        .toList();
  }
}
