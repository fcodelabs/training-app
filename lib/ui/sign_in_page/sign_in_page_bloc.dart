import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_provider.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_event.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  final TextEditingController nameController = TextEditingController();
  SignInPageBloc() : super(SignInPageState.initialState) {
    on<SetRandomNicknameEvent>(_setRandomNickname);
    on<ContinueToHomePageEvent>(_continueToHomePage);
    on<SetNameEvent>(_setName);
  }

  void _setRandomNickname(
      SetRandomNicknameEvent event, Emitter<SignInPageState> emit) {
    const names = ['John', 'Jane', 'Doe', 'Foo', 'Bar'];
    final random = Random();
    final randomIndex = random.nextInt(names.length);
    final randomNickname = names[randomIndex];
    nameController.text = randomNickname;
    emit(
      state.clone(
        name: randomNickname,
        isEnable: true,
      ),
    );
  }

  void _continueToHomePage(
      ContinueToHomePageEvent event, Emitter<SignInPageState> emit) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => DiaryHomePageProvider(name: state.name),
      ),
    );
  }

  void _setName(SetNameEvent event, Emitter<SignInPageState> emit) {
    nameController.text = event.name;
    emit(
      state.clone(
        name: event.name,
        isEnable: event.name.isNotEmpty,
      ),
    );
  }
}
