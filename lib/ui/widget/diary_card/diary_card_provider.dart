import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/widget/diary_card/diary_card_bloc.dart';
import 'package:training_app/ui/widget/diary_card/diary_card_view.dart';

class DiaryCardProvider extends BlocProvider<DiaryCardBloc> {
  DiaryCardProvider({
    Key? key,
    required String title,
    required String username,
    required String description,
  }) : super(
          key: key,
          create: (context) => DiaryCardBloc(),
          child: DiaryCard(
            title: title,
            username: username,
            description: description,
          ),
        );
}
