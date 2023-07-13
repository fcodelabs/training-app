import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/drary_home_page_provider.dart';
import 'package:training_app/ui/login_page/login_page_bloc.dart';
import 'package:training_app/ui/login_page/login_page_event.dart';
import 'package:training_app/ui/login_page/login_page_state.dart';

class LoginScreenView extends StatelessWidget {
  final TextEditingController tempNameController = TextEditingController();

  LoginScreenView({Key? key}) : super(key: key);

  void navigateToDiaryHomeScreen(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: DiaryHomeScreenProvider(name: name),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginPageBloc(tempNameController: tempNameController),
      child: Padding(
      // return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/logo.png', width: 50, height: 50),
                const Text(
                  '  Dear Diary',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<LoginPageBloc, LoginPageState>(
                    builder: (context, state) {
                      return TextField(
                        decoration: const InputDecoration(
                          labelText: 'Your Nickname*',
                          border: OutlineInputBorder(),
                        ),
                        controller: tempNameController,
                        onChanged: (value) => context.read<LoginPageBloc>().add(
                              BindChangeClickEvent(value: value),
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginPageBloc, LoginPageState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          context.read<LoginPageBloc>().add(
                                SetRandomTempNameEvent(),
                              );
                        },
                        child: const Text(
                          'RANDOM',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginPageBloc, LoginPageState>(
                    // buildWhen: (previous, current) =>
                    //     previous.name != current.name,
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(320, 45),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: (state.isEnable &&
                                context
                                    .read<LoginPageBloc>()
                                    .tempNameController
                                    .text
                                    .isNotEmpty)
                            ? () {
                                navigateToDiaryHomeScreen(
                                  context,
                                  state.name,
                                );
                                context
                                    .read<LoginPageBloc>()
                                    .tempNameController
                                    .clear();
                              }
                            : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
