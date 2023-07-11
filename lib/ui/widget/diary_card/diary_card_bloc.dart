import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_card_event.dart';
import 'diary_card_state.dart';

class DiaryCardBloc extends Bloc<DiaryCardEvent, DiaryCardState> {
  DiaryCardBloc() : super(DiaryCardState.initialState) {
    on<ToggleShowMoreEvent>(_toggleShowMoreEvent);
  }

  FutureOr<void> _toggleShowMoreEvent(
      ToggleShowMoreEvent event, Emitter<DiaryCardState> emit) {
    emit(state.clone(showMore: !state.showMore));
  }
}
