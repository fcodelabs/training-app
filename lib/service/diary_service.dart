import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryService {
  CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection('diary');

  Future<void> addDiaryCard(
      String title, String description, String username) async {
    await diaryCollection.add({
      'title': title,
      'description': description,
      'username': username,
    });
  }
}
