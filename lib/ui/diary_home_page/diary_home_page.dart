import 'package:flutter/material.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key, required String nickName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dear Diary'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Nickname',
                border: OutlineInputBorder(),
              ),
              // controller: nicknameController,
              // onChanged: (value) => bindChangeEvent(),
            ),
          ],
        ),
      ),
    );
  }
}
