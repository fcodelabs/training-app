import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';

abstract class DiaryState {}

class DiaryInitialState extends DiaryState {}

class AddDiaryState extends DiaryState {}

class DiaryLoadedState extends DiaryState {
  final List<DiaryCardProvider> diaryCards;

  DiaryLoadedState(this.diaryCards);
}
