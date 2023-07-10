abstract class DiaryCardEvent {}

class ShowMoreButtonPressed extends DiaryCardEvent {
  final bool isPressed;
  ShowMoreButtonPressed({required this.isPressed});
}
