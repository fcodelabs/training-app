abstract class DiaryEvent {}

class ToggleAddDiaryEvent extends DiaryEvent {}

class SubmitDiaryCardEvent extends DiaryEvent {
  final String title;
  final String description;

  SubmitDiaryCardEvent(this.title, this.description);
}
