import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_event.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc() : super(SignInPageState.initialState) {
    on<SetRandomNicknameEvent>(_setRandomNickname);
    on<ContinueToHomePageEvent>(_continueToHomePage);
  }

  void _setRandomNickname(
      SetRandomNicknameEvent event, Emitter<SignInPageState> emit) {
    const names = ['Name1', 'Name2', 'Name3', 'Name4', 'Name5'];
    final random = Random();
    final randomIndex = random.nextInt(names.length);
    emit(state.clone(name: names[randomIndex], isEnable: true));
  }

  void _continueToHomePage(
      ContinueToHomePageEvent event, Emitter<SignInPageState> emit) {}
}
