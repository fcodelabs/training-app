import 'package:flutter/material.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_state.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_provider.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_view.dart';

class DiaryHomePage extends StatefulWidget {
  final String name;

  const DiaryHomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<DiaryHomePage> createState() => _DiaryHomePageState();
}

class _DiaryHomePageState extends State<DiaryHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final DiaryBloc _diaryBloc = DiaryBloc();
  bool addNewDiary = false;

  @override
  void dispose() {
    _diaryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 64, 255, 1),
        elevation: 0,
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
      body: Container(
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
                widget.name,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "You are here: ${widget.name}",
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
                    setState(() {
                      addNewDiary = !addNewDiary;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color.fromARGB(50, 30, 149, 246);
                        }
                        return const Color.fromARGB(255, 30, 149, 246);
                      },
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: Text(
                      !addNewDiary ? "ADD NEW DIARY CARD" : "DISCARD CARD"),
                ),
              ),
              const SizedBox(height: 20),
              if (addNewDiary)
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
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              if (addNewDiary)
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(47, 43, 0, 255),
                  ),
                ),
              if (addNewDiary)
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
                            return const AlertDialog(
                              title: Text("My title"),
                              content: Text("This is my message."),
                            );
                          },
                        );
                        return;
                      }
                      setState(() {
                        _diaryBloc.addDiaryCard(
                          DiaryCardView(
                            username: 'Dasun',
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        );
                        titleController.clear();
                        descriptionController.clear();
                      });
                      print(titleController.text);
                      print(descriptionController.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
              const SizedBox(height: 20),
              StreamBuilder<DiaryState>(
                stream: _diaryBloc.diaryStateStream,
                initialData: DiaryInitialState(),
                builder: (context, snapshot) {
                  final diaryState = snapshot.data;
                  if (diaryState is DiaryLoadedState) {
                    return Column(
                      children: diaryState.diaryCards,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
