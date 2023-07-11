import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_view.dart';

class DiaryCardProvider extends StatelessWidget {
  final String description;
  final String title;
  final String username;

  const DiaryCardProvider(
      {Key? key,
      required this.description,
      required this.title,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryCardBloc(),
      child: DiaryCardView(
        description: description,
        title: title,
        username: username,
      ),
    );
  }
}
