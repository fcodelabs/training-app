import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_home_event.dart';
import 'diary_home_state.dart';

class DiaryHomeBloc extends Bloc<DiaryHomeEvent, DiaryHomeState> {
  DiaryHomeBloc() : super(DiaryHomeState.initialState) {
    on<InputVisibleEvent>(_inputVisibleEvent);
  }

  FutureOr<void> _inputVisibleEvent(
      InputVisibleEvent event, Emitter<DiaryHomeState> emit) {
    emit(state.clone(isInputVisible: !state.isInputVisible));
  }
}
