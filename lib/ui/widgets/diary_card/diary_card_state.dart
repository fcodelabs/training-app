class DiaryCardState {
  final bool showMore;
  final bool isPressed;

  DiaryCardState({required this.showMore, required this.isPressed});

  static DiaryCardState get initialState =>
      DiaryCardState(showMore: false, isPressed: false);

  DiaryCardState clone({bool? showMore, bool? isPressed}) {
    return DiaryCardState(
        showMore: showMore ?? this.showMore,
        isPressed: isPressed ?? this.isPressed);
  }
}
