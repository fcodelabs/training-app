import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntryModel {
  final String username;
  final String title;
  final String description;

  DiaryEntryModel({
    required this.username,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'username': username,
      'description': description,
    };
  }

  factory DiaryEntryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return DiaryEntryModel(
      title: data['title'],
      username: data['username'],
      description: data['description'],
    );
  }
}
