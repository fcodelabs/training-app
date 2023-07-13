abstract class DiaryHomePageEvent {}

class SubmitDiaryCardEvent extends DiaryHomePageEvent {
  final String username;
  final String title;
  final String description;

  SubmitDiaryCardEvent(
      {required this.title, required this.description, required this.username});
}

class SetAddNewDiaryEvent extends DiaryHomePageEvent {}

class GetAllDiaryCardsEvent extends DiaryHomePageEvent {}
