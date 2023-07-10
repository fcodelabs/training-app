import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_event.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_state.dart';

import '../diary_home_page/diary_home_page.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
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

    emit(state.clone(
      name: randomNickname,
      isEnable: true,
    ));
    print(randomNickname);
  }

  void _continueToHomePage(
      ContinueToHomePageEvent event, Emitter<SignInPageState> emit) {
    Navigator.push(
      event.context, // error here
      MaterialPageRoute(
        builder: (context) => DiaryHomePage(name: state.name),
      ),
    );
  }

  void _setName(SetNameEvent event, Emitter<SignInPageState> emit) {
    emit(state.clone(
      name: event.name,
      isEnable: true,
    ));
  }
}
