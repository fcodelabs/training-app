import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_app/ui/diary_home_page/diary_home_provider.dart';
import 'dart:ui';

import 'sign_in_page_bloc.dart';
import 'sign_in_page_event.dart';
import 'sign_in_page_state.dart';

class SignScreenView extends StatelessWidget {
  const SignScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SignInPageBloc signInPageBloc = context.read<SignInPageBloc>();

    return Scaffold(
      body: BlocBuilder<SignInPageBloc, SignInPageState>(
        builder: (context, state) {
          return Stack(
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
                            Image.asset('assets/images/blossom.png',
                                height: 40),
                            Text(
                              "  Dear Diary",
                              style: GoogleFonts.ubuntu(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
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
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 30.0,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextField(
                                    onChanged: (value) =>
                                        signInPageBloc.add(ChangeValueEvent()),
                                    decoration: InputDecoration(
                                      hintText: 'Your Nickname*',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    controller:
                                        signInPageBloc.textFieldController,
                                  ),
                                  const SizedBox(height: 16.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(120, 45),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    onPressed: () {
                                      signInPageBloc
                                          .add(GenerateRandomNameEvent());
                                    },
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    onPressed: state.isEnable &&
                                            signInPageBloc.textFieldController
                                                .text.isNotEmpty
                                        ? () {
                                            String textFieldValue =
                                                signInPageBloc
                                                    .textFieldController.text;

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DiaryHomeProvider(
                                                        textFieldValue:
                                                            textFieldValue),
                                              ),
                                            );
                                            signInPageBloc.textFieldController
                                                .clear();
                                            context.read<SignInPageBloc>().add(
                                                SetTextFieldValue(
                                                    textFieldValue: ''));
                                          }
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
          );
        },
      ),
    );
  }
}
