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

  Future<void> deleteDiaryCard(String id) async {
    await diaryCollection.doc(id).delete();
  }

  Future<void> updateDiaryCard(
      String id, String title, String description, String username) async {
    await diaryCollection.doc(id).update({
      'title': title,
      'description': description,
      'username': username,
    });
  }

  Future<List<QueryDocumentSnapshot>> getDiaryCards() async {
    QuerySnapshot querySnapshot = await diaryCollection.get();
    return querySnapshot.docs;
  }
}
