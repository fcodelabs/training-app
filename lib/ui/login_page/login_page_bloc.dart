import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/login_page/login_page_event.dart';
import 'package:training_app/ui/login_page/login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvents, LoginPageState> {
 LoginPageBloc() : super(LoginPageState.initialState) {
    on<SetRandomTempNameEvent>(_setRandomTempName);
    on<BindChangeClickEvent>(_bindChangeClickEvent);
  }

  Future<void> _setRandomTempName(SetRandomTempNameEvent event, Emitter<LoginPageState> emit) async {
     const names = [
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

    final tempName = names[index];

    print('User: ${tempName}');
    emit(
      state.clone(
        name: tempName,
        isEnable: true,
      ),
    );
  }

  Future<void> _bindChangeClickEvent(BindChangeClickEvent event, Emitter<LoginPageState> emit) async {
    emit(state.clone(
      name:event.name,
      isEnable: state.name.isNotEmpty,
    ));
  }
}
