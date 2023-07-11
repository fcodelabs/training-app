import '../widgets/diary_card/diary_card_view.dart';

class DiaryHomePageState {
  final List<DiaryCardView> diaryList;
  final bool addNewDiary;

  const DiaryHomePageState(
      {required this.diaryList, required this.addNewDiary});

  static DiaryHomePageState get initialState =>
      const DiaryHomePageState(diaryList: [], addNewDiary: false);

  DiaryHomePageState clone({
    List<DiaryCardView>? diaryList,
    bool? addNewDiary,
  }) {
    return DiaryHomePageState(
      diaryList: diaryList ?? this.diaryList,
      addNewDiary: addNewDiary ?? this.addNewDiary,
    );
  }
}
