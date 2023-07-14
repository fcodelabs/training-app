import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:training_app/util/diary_entry.dart';

import '../model/diary_entry_model.dart';

class DiaryRepository extends ChangeNotifier {
  final CollectionReference _diaryCollection =
      FirebaseFirestore.instance.collection('diary_entries');

  Future<List<DiaryEntry>> getAllDiaryEntries() async {
    final QuerySnapshot snapshot = await _diaryCollection.get();
    return snapshot.docs
        .map(
          (doc) => DiaryEntry(
            title: doc['title'],
            description: doc['description'],
            username: doc['username'],
          ),
        )
        .toList();
  }

  Future<void> saveDiaryEntry(DiaryEntryModel entry) async {
    await _diaryCollection.add(entry.toMap());
  }
}
