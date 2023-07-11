import 'package:flutter/material.dart';

import 'ui/root_page/root_page.dart';
import 'util/firebase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.initialize();

  runApp(const DearDiaryApp());
}
