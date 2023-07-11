import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_card_bloc.dart';
import 'diary_card_view.dart';

class SignInPageProvider extends BlocProvider<DiaryCardBloc> {
  SignInPageProvider({
    Key? key,
  }) : super(
          key: key,
          create: (context) => DiaryCardBloc(),
          child: const DiaryCardView(
            title: '',
            username: '',
            description: '',
          ),
        );
}
