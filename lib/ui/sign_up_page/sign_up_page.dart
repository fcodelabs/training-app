import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();
    late String nickName = '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/t2.jpg', width: 50, height: 50),
            const Text(
              '  Dear Diary',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(20),
          height: 300,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 39, 115, 182),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Your Nickname',
                  border: OutlineInputBorder(),
                ),
                // controller: TextEditingController(text: nickName),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  nickName = faker.person.name();
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
                child: const Text('RANDOM'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
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
                  child: const Text('CONTINUE'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
