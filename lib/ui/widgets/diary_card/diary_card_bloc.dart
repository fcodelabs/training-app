import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_event.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_state.dart';

class DiaryCardBloc extends Bloc<DiaryCardEvent, DiaryCardState> {
  DiaryCardBloc() : super(DiaryCardState.initialState) {
    on<ShowMoreButtonPressed>(_showMoreButtonPressed);
  }

  void _showMoreButtonPressed(
      ShowMoreButtonPressed event, Emitter<DiaryCardState> emit) {
    print(state.description.length < 10
        ? state.description
        : "${state.description.substring(0, 10)}...");
    emit(state.clone(
        isPressed: !state.isPressed,
        description: event.description.length < 10
            ? event.description
            : "${event.description.substring(0, 10)}..."));
  }
}
