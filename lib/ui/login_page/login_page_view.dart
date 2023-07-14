import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/drary_home_page_provider.dart';
import 'package:training_app/ui/login_page/login_page_bloc.dart';
import 'package:training_app/ui/login_page/login_page_event.dart';
import 'package:training_app/ui/login_page/login_page_state.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginPageBloc loginPageBloc = BlocProvider.of<LoginPageBloc>(context);
    final TextEditingController tempNameController = TextEditingController();

    return Padding(
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
                  buildWhen: (previous, current) =>
                      current.name != previous.name,
                  builder: (context, state) {
                    tempNameController.text = state.name;
                    return TextField(
                      decoration: const InputDecoration(
                        labelText: 'Your Nickname*',
                        border: OutlineInputBorder(),
                      ),
                      controller: tempNameController,
                      onChanged: (value) => {
                        loginPageBloc.add(
                          BindChangeClickEvent(name: value),
                        ),
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  onPressed: () {
                    loginPageBloc.add(
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
                ),
                //   },
                // ),
                const SizedBox(height: 20),
                BlocBuilder<LoginPageBloc, LoginPageState>(
                  buildWhen: (previous, current) =>
                      previous.isEnable != current.isEnable,
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(320, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: state.isEnable
                          ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DiaryHomeScreenProvider(name: state.name),
                                ),
                              )
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
      // ),
    );
  }
}
