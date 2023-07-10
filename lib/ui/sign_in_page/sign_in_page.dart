import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import '../diary_home_page/diary_home_page.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  SignInForm createState() => SignInForm();
}

class SignInForm extends State<SignScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  bool isEnable = false;
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
      _textFieldController.text = names[index];
      isEnable = true;
    });
  }

  void blindChangeEvent(vale) {
    setState(() {
      isEnable = _textFieldController.text.isNotEmpty;
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
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/blossom.png', height: 40),
                        Text(
                          "  Dear Diary",
                          style: GoogleFonts.ubuntu(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        padding: const EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height * 0.34,
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In",
                                style: GoogleFonts.ubuntu(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 30.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              TextField(
                                onChanged: (value) => blindChangeEvent(value),
                                decoration: InputDecoration(
                                  hintText: 'Your Nickname*',
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                controller: _textFieldController,
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
                                child: Text(
                                  'RANDOM',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    fontSize: 16.0,
                                    color: Colors.white,
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
                                onPressed: isEnable
                                    ? () {
                                        String textFieldValue =
                                            _textFieldController.text;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenState(textFieldValue),
                                          ),
                                        );
                                        _textFieldController.clear();
                                        isEnable = false;
                                      }
                                    : null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'CONTINUE  ',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
