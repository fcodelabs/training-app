import 'package:training_app/db/model/diary.dart';

class DiaryHomePageState {
  final List<Diary> diaryList;
  final bool addNewDiary;

  const DiaryHomePageState(
      {required this.diaryList, required this.addNewDiary});

  static DiaryHomePageState get initialState =>
      const DiaryHomePageState(diaryList: [], addNewDiary: false);

  DiaryHomePageState clone({
    List<Diary>? diaryList,
    bool? addNewDiary,
  }) {
    return DiaryHomePageState(
      diaryList: diaryList ?? this.diaryList,
      addNewDiary: addNewDiary ?? this.addNewDiary,
    );
  }
}
