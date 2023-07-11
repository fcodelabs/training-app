import 'package:training_app/ui/widgets/diary_card/diary_card_view.dart';

abstract class DiaryState {}

class DiaryInitialState extends DiaryState {}

class AddDiaryState extends DiaryState {}

class DiaryLoadedState extends DiaryState {
  final List<DiaryCardView> diaryCards;

  DiaryLoadedState(this.diaryCards);
}
