import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/diary_entry.dart';
import '../widget/diary_card_view.dart';
import 'diary_home_bloc.dart';
import 'diary_home_event.dart';
import 'diary_home_state.dart';

// ignore: must_be_immutable
class DiaryHomeScreen extends StatelessWidget {
  final String textFieldValue;
  TextEditingController textFieldController = TextEditingController();
  TextEditingController textAreaController = TextEditingController();

  DiaryHomeScreen({super.key, required this.textFieldValue});

  void clear() {
    textFieldController.clear();
    textAreaController.clear();
  }

  Widget _buildDiaryCardView(DiaryEntry entry) {
    return DiaryCardView(
      title: entry.title,
      username: entry.username,
      description: entry.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    DiaryHomeBloc diaryHomeBloc = context.read<DiaryHomeBloc>();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: BlocBuilder<DiaryHomeBloc, DiaryHomeState>(
          buildWhen: (previous, current) =>
              previous.isInputVisible != current.isInputVisible,
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
                    color: Colors.black.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.notifications,
                                      size: 45,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('User Name'),
                                            content: Text(textFieldValue),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Image.asset(
                                        'assets/images/user.png',
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " Home",
                                style: GoogleFonts.ubuntu(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 32.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 22.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "  You are here: $textFieldValue",
                                style: GoogleFonts.ubuntu(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 15.0,
                                  color: Colors.white30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 26.0),
                            Visibility(
                              visible: state.isInputVisible,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: textFieldController,
                                    decoration: InputDecoration(
                                      hintText: 'Submit New',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blue[300],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: textAreaController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Description',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.blue[200],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    height: 45,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (textFieldController.text.isEmpty ||
                                            textAreaController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Title and Description cannot be empty'),
                                            ),
                                          );
                                        } else {
                                          context.read<DiaryHomeBloc>().add(
                                              SubmitDataEvent(
                                                  textAreaValue:
                                                      textFieldController.text
                                                          .trim(),
                                                  textAreaController:
                                                      textAreaController.text
                                                          .trim(),
                                                  textFieldValue:
                                                      textFieldValue));
                                          clear();
                                        }
                                      },
                                      child: Text(
                                        'SUBMIT',
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
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo[200],
                                  fixedSize: const Size(160, 35),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                onPressed: () {
                                  context
                                      .read<DiaryHomeBloc>()
                                      .add(InputVisibleEvent());
                                },
                                child: Text(
                                  state.isInputVisible ? 'Close' : 'Submit New',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 45),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.diaryEntries.length,
                              itemBuilder: (context, index) {
                                final entry = state.diaryEntries[index];
                                return _buildDiaryCardView(entry);
                              },
                            )
                          ],
                        ),
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
