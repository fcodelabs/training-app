import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widget/diary_card.dart';

class DiaryHomeScreenView extends StatelessWidget {
  final String name;

  const DiaryHomeScreenView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    
    DiaryHomeScreenBloc diaryHomeScreenBloc =
        BlocProvider.of<DiaryHomeScreenBloc>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DiaryHomeScreenBloc, DiaryHomeScreenState>(
                  buildWhen: (previous, current) =>
                      previous.isSubmitting != current.isSubmitting,
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "You are here: Home",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(height: 30),
                        if (!state.isSubmitting)
                          Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent[700],
                                fixedSize: const Size(180, 40),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                diaryHomeScreenBloc.add(
                                  SubmitNewButtonPressed(),
                                );
                              },
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Submit New',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 25),
                        // if (isSubmitting)
                        if (state.isSubmitting)
                          Column(
                            children: [
                              TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Title',
                                  filled: true,
                                  fillColor: Color.fromRGBO(31, 118, 239, 0.6),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 18),
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                                style: const TextStyle(),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[700],
                                  fixedSize: const Size(500, 55),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (titleController.text.isEmpty ||
                                      descriptionController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please provide both title and description.'),
                                      ),
                                    );
                                  } else {
                                    diaryHomeScreenBloc.add(
                                      SubmitButtonPressed(
                                        username: name,
                                        title: titleController.text,
                                        description: descriptionController.text,
                                      ),
                                    );
                                    titleController.clear();
                                    descriptionController.clear();
                                  }
                                },
                                child: const Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: descriptionController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  hintText: 'Description',
                                  filled: true,
                                  fillColor: Color.fromRGBO(31, 118, 239, 0.6),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 18, top: 18),
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<DiaryHomeScreenBloc, DiaryHomeScreenState>(
                  buildWhen: (previous, current) =>
                      previous.entries != current.entries,
                  builder: (context, state) {
                    return Column(
                      children: state.entries.map(
                        (entry) {
                          return DiaryCard(
                            title: entry.title,
                            username: entry.username,
                            description: entry.description,
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 10,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_active_outlined,
                    color: Colors.white, size: 40),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
              IconButton(
                icon: const Icon(Icons.person_3_rounded,
                    color: Colors.white, size: 40),
                onPressed: () {
                  // Handle profile icon press
                },
              ),
            ],
          ),
        ),
      ],
      // ),
    );
  }
}
