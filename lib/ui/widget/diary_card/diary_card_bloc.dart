import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:training_app/ui/widget/diary_card/diary_card_event.dart';
import 'package:training_app/ui/widget/diary_card/diary_card_state.dart';

class DiaryCardBloc extends Bloc<DiaryCardEvent, DiaryCardState> {
  DiaryCardBloc() : super(DiaryCardState.initialState) {
    on<ToggleShowMore>(_onToggleShowMore);
  }

  void _onToggleShowMore(
    ToggleShowMore event,
    Emitter<DiaryCardState> emit,
  ) {
    emit(state.clone(showMore: event.showMore));
  }
}
