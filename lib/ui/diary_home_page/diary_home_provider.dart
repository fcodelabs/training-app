import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_home_bloc.dart';
import 'diary_home_view.dart';

class DiaryHomeProvider extends StatelessWidget {
  final String textFieldValue;

  const DiaryHomeProvider({Key? key, required this.textFieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryHomeBloc(),
      child: DiaryHomeScreen(
        textFieldValue: textFieldValue,
      ),
    );
  }
}
