import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/root_page/root_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseConfig.initialize();
  await Firebase.initializeApp();
  runApp(const DearDiaryApp());
}
