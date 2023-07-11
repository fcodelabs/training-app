import 'package:flutter/material.dart';
import 'package:training_app/ui/login_page/login_page_view.dart';

void main() {
  runApp(const DearDiaryApp());
}

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
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: LoginScreenView(),
          ),
        ),
      ),
    );
  }
}
