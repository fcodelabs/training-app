import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/diary_card_entry.dart';

class DiaryRepository {
  final CollectionReference _diaryCollection =
      FirebaseFirestore.instance.collection('diary');

  Future<void> addDiaryCardEntry(DiaryCardEntryModel diaryCardEntry) async {
    log(diaryCardEntry.toString());
    await _diaryCollection.add({
      'title': diaryCardEntry.title,
      'description': diaryCardEntry.description,
      'username': diaryCardEntry.username,
    }).then((value) => print('Diary card entry added'));
  }

  Future<List<QueryDocumentSnapshot>> getDiaryCardEntries() async {
    QuerySnapshot querySnapshot = await _diaryCollection.get();
    return querySnapshot.docs;
  }
}
