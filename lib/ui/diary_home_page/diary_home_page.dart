import 'package:flutter/material.dart';

class DiaryHomeScreen extends StatefulWidget {
  const DiaryHomeScreen({super.key});

  @override
  State<DiaryHomeScreen> createState() => _DiaryHomeScreenState();
}

class _DiaryHomeScreenState extends State<DiaryHomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void submitButtonPressed() {
    String title = titleController.text;
    String description = descriptionController.text;

    print('Title: $title');
    print('Description: $description');

    titleController.clear();
    descriptionController.clear();
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
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Submit New',
                        filled: true,
                        fillColor: Color.fromRGBO(31, 118, 239, 0.6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 18), // Adjust the padding value as needed
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
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: submitButtonPressed,
                      // Add logic for the first button here
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
                        hintText: 'Enter Description',
                        filled: true,
                        fillColor: Color.fromRGBO(31, 118, 239, 0.6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 18,
                            top: 18), // Adjust the padding value as needed
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      style: const TextStyle(),
                    ),
                  ],
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
