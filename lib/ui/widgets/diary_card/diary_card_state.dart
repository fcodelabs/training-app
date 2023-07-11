class DiaryCardState {
  final bool isPressed;
  final String description;

  DiaryCardState({required this.isPressed, required this.description});

  static DiaryCardState get initialState =>
      DiaryCardState(isPressed: false, description: "");

  DiaryCardState clone({bool? isPressed, String? description}) {
    return DiaryCardState(
        isPressed: isPressed ?? this.isPressed, description: this.description);
  }
}
