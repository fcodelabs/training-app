import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final bool showMore;

  const DiaryCardState({
    required this.showMore,
  });

  static DiaryCardState get initialState => const DiaryCardState(
        showMore: false,
      );

  DiaryCardState clone({
    bool? showMore,
  }) {
    return DiaryCardState(
      showMore: showMore ?? this.showMore,
    );
  }
}
