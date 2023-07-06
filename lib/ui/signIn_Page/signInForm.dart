import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  SignInForm createState() => SignInForm();
}

class SignInForm extends State<SignScreen> {
  String randomName = '';

  void generateRandomName() {
    List<String> names = [
      'John',
      'Jane',
      'Mike',
      'Emily',
      'David',
      'Sarah',
      'Mark',
      'Jessica',
      'Chris',
      'Lisa'
    ];
    Random random = Random();
    int index = random.nextInt(names.length);
    setState(() {
      randomName = names[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY:
                    5), // Adjust the sigmaX and sigmaY values for the desired blur intensity
            child: Container(
              color:
                  Colors.black.withOpacity(0.5), // Adjust the opacity as needed
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/blossom.png', height: 40),
                        const Text(
                          "  Dear Diary",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        padding: const EdgeInsets.all(20),
                        height: 320.0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 1.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Your Nickname*',
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              controller:
                                  TextEditingController(text: randomName),
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 45),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              onPressed: generateRandomName,
                              // Add logic for the first button here
                              child: const Text(
                                'RANDOM',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(320, 45),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              onPressed: () {
                                // Add logic for the button here
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'CONTINUE  ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/right-arrow.png',
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
