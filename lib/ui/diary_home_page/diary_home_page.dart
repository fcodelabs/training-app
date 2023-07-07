import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenState extends StatefulWidget {
  final String textFieldValue;
  const ScreenState(this.textFieldValue, {super.key});
  @override
  // ignore: no_logic_in_create_state
  DiaryHomePage createState() => DiaryHomePage(textFieldValue);
}

// class DiaryHomePage extends State<ScreenState> {
//   final String textFieldValue;
//   DiaryHomePage(this.textFieldValue);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/bg_image.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: Container(
//               color: Colors.black.withOpacity(0.3),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(right: 10.0),
//                             child: Icon(
//                               Icons.notifications,
//                               size: 50,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: const Text('User Name'),
//                                     content: Text(textFieldValue),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: const Text('Close'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             child: MouseRegion(
//                               cursor: SystemMouseCursors.grab,
//                               child: Image.asset(
//                                 'assets/images/user.png',
//                                 height: 50,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16.0),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DiaryHomePage extends State<ScreenState> {
  final String textFieldValue;
  TextEditingController textFieldController = TextEditingController();
  TextEditingController textAreaController = TextEditingController();

  DiaryHomePage(this.textFieldValue);

  @override
  void dispose() {
    textFieldController.dispose();
    textAreaController.dispose();
    super.dispose();
  }

  void clear() {
    textFieldController.clear();
    textAreaController.clear();
  }

  void submitData() {
    String textFieldInput = textFieldController.text;
    String textAreaInput = textAreaController.text;

    print('User Name: $textFieldValue');
    print('Title : $textFieldInput');
    print('Description : $textAreaInput');
    clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
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
              color: Colors.black.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                              cursor: SystemMouseCursors.grab,
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
                      alignment: Alignment.centerLeft, // Added
                      child: Text(
                        " Home",
                        style: GoogleFonts.ubuntu(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 32.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Align(
                      alignment: Alignment.centerLeft, // Added
                      child: Text(
                        "  Your are here :  $textFieldValue",
                        style: GoogleFonts.ubuntu(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15.0,
                          color: Colors.white30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26.0),
                    TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                        hintText: 'Submit New',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.blue[300],
                        contentPadding: const EdgeInsets.symmetric(
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.blue[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(420, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onPressed: submitData,
                      child: Text(
                        'SUBMIT',
                        style: GoogleFonts.ubuntu(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
