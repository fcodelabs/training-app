import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_view.dart';

import '../sign_in_page/sign_in_page_event.dart';
import '../sign_in_page/sign_in_page_state.dart';

class DiaryHomePageBloc extends Bloc<DiaryHomePageEvent, DiaryHomePageState> {
  final _diaryCardsController =
      StreamController<DiaryHomePageState>.broadcast();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final List<DiaryCardView> _diaryCards = [];

  DiaryHomePageBloc() : super(DiaryHomePageState.initialState) {
    on<SubmitDiaryCardEvent>(_addDiaryCard);
  }

  void _addDiaryCard(DiaryCardView card) {
    _diaryCards.add(card);
    _diaryCardsController.sink.add(DiaryLoadedState(_diaryCards));
  }
}
