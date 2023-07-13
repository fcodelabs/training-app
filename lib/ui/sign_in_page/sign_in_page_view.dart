import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_provider.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_state.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_event.dart';

class SignInPageView extends StatelessWidget {
  const SignInPageView({super.key});

  @override
  Widget build(BuildContext context) {
    SignInPageBloc bloc = BlocProvider.of<SignInPageBloc>(context);
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Dear Diary",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
                      BlocBuilder<SignInPageBloc, SignInPageState>(
                        buildWhen: (previous, current) =>
                            current.name != previous.name,
                        builder: (context, state) {
                          nameController.text = state.name;
                          nameController.selection = TextSelection.fromPosition(
                            TextPosition(offset: nameController.text.length),
                          );
                          return TextField(
                            decoration: const InputDecoration(
                              labelText: 'Your Nickname',
                              border: OutlineInputBorder(),
                            ),
                            controller: nameController,
                            onChanged: (value) => {
                              bloc.add(
                                SetNameEvent(name: value),
                              ),
                              nameController.text = value,
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          bloc.add(
                            SetRandomNicknameEvent(),
                          );
                          nameController.text = bloc.state.name;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 39, 115, 182),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
                        child: BlocBuilder<SignInPageBloc, SignInPageState>(
                          buildWhen: (previous, current) =>
                              current.isEnable != previous.isEnable,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.isEnable
                                  ? () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DiaryHomePageProvider(
                                                  name: nameController.text),
                                        ),
                                      )
                                  : null,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return const Color.fromARGB(
                                          50, 30, 149, 246);
                                    }
                                    return const Color.fromARGB(
                                        255, 30, 149, 246);
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('CONTINUE '),
                                  Icon(Icons.arrow_forward),
                                  SizedBox(width: 8),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
