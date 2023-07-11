import '../widgets/diary_card/diary_card_view.dart';

class DiaryHomePageState {
  final List<DiaryCardView> diaryList;

  const DiaryHomePageState({required this.diaryList});

  static DiaryHomePageState get initialState =>
      const DiaryHomePageState(diaryList: []);

  DiaryHomePageState clone({
    List<DiaryCardView>? diaryList,
  }) {
    return DiaryHomePageState(
      diaryList: diaryList ?? this.diaryList,
    );
  }
}
