import 'package:flutter/material.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page.dart';

class DearDiaryApp extends StatelessWidget {
  const DearDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dear Diary',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          backgroundColor: Colors.blue,
          body: SignInPage(),
        ));
  }
}
