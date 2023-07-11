import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_event.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_state.dart';

class DiaryCardBloc extends Bloc<DiaryCardEvent, DiaryCardState> {
  DiaryCardBloc() : super(DiaryCardState.initialState) {
    on<ShowMoreButtonPressed>(_showMoreButtonPressed);
  }

  void _showMoreButtonPressed(
      ShowMoreButtonPressed event, Emitter<DiaryCardState> emit) {
    emit(state.clone(isPressed: !state.isPressed));
  }
}
