import 'dart:async';

import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_view.dart';

class DiaryBloc {
  final _diaryCardsController = StreamController<DiaryState>.broadcast();
  final List<DiaryCardView> _diaryCards = [];

  Stream<DiaryState> get diaryStateStream => _diaryCardsController.stream;

  void addDiaryCard(DiaryCardView card) {
    _diaryCards.add(card);
    _diaryCardsController.sink.add(DiaryLoadedState(_diaryCards));
  }

  void toggleAddDiary() {
    _diaryCardsController.sink.add(AddDiaryState());
  }

  void submitDiaryCard(String username, String title, String description) {
    if (title.isEmpty || description.isEmpty) {
      _diaryCardsController.sink.add(DiaryInitialState());
      return;
    }
    addDiaryCard(
      DiaryCardView(
        username: username,
        title: title,
        description: description,
      ),
    );
  }

  void dispose() {
    _diaryCardsController.close();
  }
}
