abstract class DiaryCardEvent {}

class ShowMoreButtonPressed extends DiaryCardEvent {
  final String description;
  ShowMoreButtonPressed(this.description);
}

class SetDescription extends DiaryCardEvent {
  final String description;
  SetDescription(this.description);
}
