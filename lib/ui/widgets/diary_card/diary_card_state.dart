class DiaryCardState {
  final bool isPressed;

  DiaryCardState({required this.isPressed});

  static DiaryCardState get initialState => DiaryCardState(isPressed: false);

  DiaryCardState clone({bool? isPressed}) {
    return DiaryCardState(isPressed: isPressed ?? this.isPressed);
  }
}
