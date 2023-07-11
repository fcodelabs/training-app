import 'dart:async';

import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';

class DiaryBloc {
  final _diaryCardsController = StreamController<DiaryState>.broadcast();
  final List<DiaryCardProvider> _diaryCards = [];

  Stream<DiaryState> get diaryStateStream => _diaryCardsController.stream;

  void addDiaryCard(DiaryCardProvider card) {
    _diaryCards.add(card);
    _diaryCardsController.sink.add(DiaryLoadedState(_diaryCards));
  }

  void toggleAddDiary() {
    _diaryCardsController.sink.add(AddDiaryState());
  }

  void submitDiaryCard(String title, String description) {
    if (title.isEmpty || description.isEmpty) {
      _diaryCardsController.sink.add(DiaryInitialState());
      return;
    }
    addDiaryCard(
      DiaryCardProvider(
        username: 'Dasun',
        title: title,
        description: description,
      ),
    );
  }

  void dispose() {
    _diaryCardsController.close();
  }
}
