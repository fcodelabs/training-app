import 'package:training_app/ui/widgets/diary_card/diary_card.dart';

class DiaryHomePageState {
  final List<DiaryCard> diaryList;
  final bool addNewDiary;

  const DiaryHomePageState(
      {required this.diaryList, required this.addNewDiary});

  static DiaryHomePageState get initialState =>
      const DiaryHomePageState(diaryList: [], addNewDiary: false);

  DiaryHomePageState clone({
    List<DiaryCard>? diaryList,
    bool? addNewDiary,
  }) {
    return DiaryHomePageState(
      diaryList: diaryList ?? this.diaryList,
      addNewDiary: addNewDiary ?? this.addNewDiary,
    );
  }
}
