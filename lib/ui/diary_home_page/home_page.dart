import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String textFieldValue;

  const SecondScreen(this.textFieldValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Value from First Screen:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              textFieldValue,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
