import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';

class DiaryHomePageState {
  final List<DiaryCardProvider> diaryList;
  final bool addNewDiary;

  const DiaryHomePageState(
      {required this.diaryList, required this.addNewDiary});

  static DiaryHomePageState get initialState =>
      const DiaryHomePageState(diaryList: [], addNewDiary: false);

  DiaryHomePageState clone({
    List<DiaryCardProvider>? diaryList,
    bool? addNewDiary,
  }) {
    return DiaryHomePageState(
      diaryList: diaryList ?? this.diaryList,
      addNewDiary: addNewDiary ?? this.addNewDiary,
    );
  }
}
