import 'package:flutter/material.dart';
import 'package:training_app/ui/widget/diary_card/diary_card.dart';

class DiaryHomeScreen extends StatefulWidget {
  final String name;
  const DiaryHomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<DiaryHomeScreen> createState() => _DiaryHomeScreenState();
}

class _DiaryHomeScreenState extends State<DiaryHomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<DiaryEntry> entries = [];
  bool isSubmitting = false;

  void submitNewButtonPressed() {
    setState(() {
      isSubmitting = true;
    });
  }

  void submitButtonPressed() {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    String username = widget.name.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      DiaryEntry newEntry = DiaryEntry(title: title, description: description, username: username);
      setState(() {
        entries.add(newEntry);
        isSubmitting = false;
      });
      titleController.clear();
      descriptionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide both title and description.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                    if (!isSubmitting)
                      Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent[700],
                            fixedSize: const Size(180, 40),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: submitNewButtonPressed,
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
                    if (isSubmitting)
                      Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              hintText: 'Title',
                              filled: true,
                              fillColor: Color.fromRGBO(31, 118, 239, 0.6),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.only(
                                  left:
                                      18), // Adjust the padding value as needed
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                            ),
                            onPressed: submitButtonPressed,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 18,
                                  top:
                                      18), // Adjust the padding value as needed
                              hintStyle: TextStyle(fontSize: 18),
                            ),
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: entries.map((entry) {
                    return DiaryCard(
                      title: entry.title,
                      // username: 'John Doe',
                      username: entry.username,
                      description: entry.description,
                    );
                  }).toList(),
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
    );
  }
}

class DiaryEntry {
  final String title;
  final String description;
  final String username;

  DiaryEntry(
      {required this.title, required this.description, required this.username});
}
