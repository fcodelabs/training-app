import 'package:firebase_database/firebase_database.dart';

class Diary {
  String username;
  String title;
  String description;

  Diary(
      {required this.username, required this.title, required this.description});

  static fromSnapshot(DataSnapshot snapshot) {}
}
