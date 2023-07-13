import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_event.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card.dart';

class DiaryHomePageView extends StatelessWidget {
  const DiaryHomePageView({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    DiaryHomePageBloc bloc = BlocProvider.of<DiaryHomePageBloc>(context);

    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    bloc.add(
      GetAllDiaryCardsEvent(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 64, 255, 1),
        elevation: 4,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/images/logo.png', width: 20, height: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
      ),
      body: BlocBuilder<DiaryHomePageBloc, DiaryHomePageState>(
        buildWhen: (previous, current) =>
            current.addNewDiary != previous.addNewDiary,
        builder: (context, state) {
          return Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "You are here: $name",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(182, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<DiaryHomePageBloc>().add(
                              SetAddNewDiaryEvent(),
                            );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return const Color.fromARGB(50, 30, 149, 246);
                            }
                            return const Color.fromARGB(255, 30, 149, 246);
                          },
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      child: Text(!state.addNewDiary
                          ? "ADD NEW DIARY CARD"
                          : "DISCARD CARD"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (state.addNewDiary)
                    TextField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Submit New',
                        filled: true,
                        fillColor: Color.fromARGB(47, 43, 0, 255),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (state.addNewDiary)
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter Description',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(47, 43, 0, 255),
                      ),
                    ),
                  if (state.addNewDiary)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleController.text.isEmpty ||
                              descriptionController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error..!"),
                                  content:
                                      const Text("You must fill all fields..!"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          context.read<DiaryHomePageBloc>().add(
                                SubmitDiaryCardEvent(
                                    description: descriptionController.text,
                                    title: titleController.text,
                                    username: name),
                              );
                          titleController.clear();
                          descriptionController.clear();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return const Color.fromARGB(255, 177, 173, 173);
                              }
                              return const Color.fromARGB(255, 30, 149, 246);
                            },
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  BlocBuilder<DiaryHomePageBloc, DiaryHomePageState>(
                    buildWhen: (previous, current) =>
                        current.diaryList != previous.diaryList,
                    builder: (context, state) => state.diaryList.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.58,
                            child: SingleChildScrollView(
                              child: Column(
                                children: state.diaryList
                                    .map(
                                      (diary) => DiaryCard(diary: diary),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
