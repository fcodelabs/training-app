import 'package:flutter/material.dart';
import 'package:training_app/ui/sign_up_page/sign_up_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: SignInPage(),
          )),
    );
  }
}
