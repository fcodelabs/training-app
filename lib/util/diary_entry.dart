import 'package:training_app/db/model/diary_entry_model.dart';

class DiaryEntry {
  final String title;
  final String username;
  final String description;

  DiaryEntry({
    required this.title,
    required this.username,
    required this.description,
  });

  static fromModel(DiaryEntryModel entry) {}
}