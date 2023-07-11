import 'dart:async';

import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';

class DiaryBloc {
  final _diaryCardsController =
      StreamController<List<DiaryCardProvider>>.broadcast();
  final List<DiaryCardProvider> _diaryCards = [];

  Stream<List<DiaryCardProvider>> get diaryCardsStream =>
      _diaryCardsController.stream;

  void addDiaryCard(DiaryCardProvider card) {
    _diaryCards.add(card);
    _diaryCardsController.sink.add(_diaryCards);
  }

  void dispose() {
    _diaryCardsController.close();
  }
}
