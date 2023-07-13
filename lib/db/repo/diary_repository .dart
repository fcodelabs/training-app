import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/diary_entry.dart';

class DiaryRepository {
  final CollectionReference _diaryCollection =
      FirebaseFirestore.instance.collection('diary_entries');

  Future<void> saveDiaryEntry(DiaryEntryModel entry) async {
    await _diaryCollection.add(entry.toMap());
  }

  Future<List<DiaryEntryModel>> getAllDiaryEntries() async {
    final QuerySnapshot snapshot = await _diaryCollection.get();
    final List<DiaryEntryModel> entries =
        snapshot.docs.map((doc) => DiaryEntryModel.fromSnapshot(doc)).toList();
    return entries;
  }
}
