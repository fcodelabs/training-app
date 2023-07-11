import 'dart:math';

import 'package:flutter/material.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<LoginScreen> {
  final TextEditingController tempNameController = TextEditingController();
  bool isEnable = false;
  String name = '';
  void setRandomTempName() {
    final List<String> names = [
      'Pahasara',
      'Nimesh',
      'Sadun',
      'Pasan',
      'Maneesha',
      'Iduranga',
      'Gunawardhana',
      'Piyumantha'
    ];
    final Random random = Random();
    final int index = random.nextInt(names.length);
    setState(() {
      tempNameController.text = names[index];
      name = tempNameController.text;
      isEnable = true;
    });
  }

  void bindChangeClickEvent() {
    setState(() {
      isEnable = tempNameController.text.isNotEmpty;
      name = tempNameController.text;
    });
  }

  void navigateToDiaryHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: DiaryHomeScreen(name: name),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/logo.png', width: 50, height: 50),
              const Text(
                '  Dear Diary',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Your Nickname*',
                    border: OutlineInputBorder(),
                  ),
                  controller: tempNameController,
                  onChanged: (value) => bindChangeClickEvent(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  onPressed: () {
                    setRandomTempName();
                  },
                  // Add logic for the first button here
                  child: const Text(
                    'RANDOM',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 45),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  onPressed: isEnable ? navigateToDiaryHomeScreen : null,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
