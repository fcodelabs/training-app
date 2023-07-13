import 'package:flutter/material.dart';

import '../sign_in_page/sign_in_page_view.dart';

class DearDiaryApp extends StatelessWidget {
  const DearDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dear Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
    );
  }
}
