import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_event.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  final TextEditingController textFieldController = TextEditingController();

  SignInPageBloc() : super(SignInPageState.initialState) {
    on<ChangeValueEvent>(_changeValueEvent);
    on<ContinueEvent>(_continueEvent);
    on<SetTextFieldValue>(_setTextFieldValue);
    on<GenerateRandomNameEvent>(_generateRandomNameEvent);
  }

  void _continueEvent(
    ContinueEvent event,
    Emitter<SignInPageState> emit,
  ) {}

  void _setTextFieldValue(
    SetTextFieldValue event,
    Emitter<SignInPageState> emit,
  ) {
    emit(state.clone(
        textFieldValue: event.textFieldValue,
        isEnable: state.textFieldValue.isNotEmpty ? false : true));
  }

  void _generateRandomNameEvent(
    GenerateRandomNameEvent event,
    Emitter<SignInPageState> emit,
  ) {
    List<String> names = [
      'John',
      'Jane',
      'Mike',
      'Emily',
      'David',
      'Sarah',
      'Mark',
      'Jessica',
      'Chris',
      'Lisa'
    ];
    Random random = Random();
    int index = random.nextInt(names.length);

    textFieldController.text = names[index];

    emit(
      state.clone(
        isEnable: true,
        textFieldValue: textFieldController.text,
      ),
    );
  }

  FutureOr<void> _changeValueEvent(
      ChangeValueEvent event, Emitter<SignInPageState> emit) {
    emit(state.clone(isEnable: true));
  }
}
