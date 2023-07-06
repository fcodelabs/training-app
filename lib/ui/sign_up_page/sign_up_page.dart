import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Sign In"),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your Nickname',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 39, 115, 182)),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: const Text('RANDOM')),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () {
                    // Perform sign-in logic here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 39, 115, 182)),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: const Text('CONTINUE')),
            )
          ],
        ));
  }
}
