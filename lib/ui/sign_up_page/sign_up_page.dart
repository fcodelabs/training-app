import 'dart:math';

import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String nickName = '';
  final List<String> array = ['Name1', 'Name2', 'Name3', 'Name4', 'Name5'];

  void setRandomNickname() {
    setState(() {
      final random = Random();
      final randomIndex = random.nextInt(array.length);
      nickName = array[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/t2.jpg', width: 50, height: 50),
            const Text(
              '  Dear Diary',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(20),
          height: 300,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 39, 115, 182),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Your Nickname',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: nickName),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setRandomNickname();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 39, 115, 182)),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: const Text('RANDOM'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 39, 115, 182)),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: const Text('CONTINUE'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
