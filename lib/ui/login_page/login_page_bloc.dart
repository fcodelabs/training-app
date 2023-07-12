import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:training_app/ui/login_page/login_page_event.dart';
import 'package:training_app/ui/login_page/login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvents, LoginPageState> {
  final TextEditingController tempNameController;

  LoginPageBloc({required this.tempNameController})
      : super(LoginPageState.initialState) {
    on<SetRandomTempNameEvent>(_setRandomTempName);
    on<BindChangeClickEvent>(_bindChangeClickEvent);
  }

  void _setRandomTempName(
    SetRandomTempNameEvent event,
    Emitter<LoginPageState> emit,
  ) {
    List<String> names = [
      'Pahasara',
      'Nimesh',
      'Sadun',
      'Pasan',
      'Maneesha',
      'Iduranga',
      'Gunawardhana',
      'Piyumantha'
    ];
    final random = Random();
    final index = random.nextInt(names.length);

    tempNameController.text = names[index];

    print('tempNameController.text: ${tempNameController.text}');
    emit(state.clone(
      name: tempNameController.text,
      isEnable: true,
    ));
  }

  void _bindChangeClickEvent(
    BindChangeClickEvent event,
    Emitter<LoginPageState> emit,
  ) {
    emit(state.clone(
      name: tempNameController.text,
      isEnable: state.name.isNotEmpty ? true : false,
    ));
  }
}
