// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
// import 'package:training_app/ui/diary_home_page/diary_home_page_view.dart';

// class DiaryHomeScreenProvider extends BlocProvider<DiaryHomeScreenBloc> {
//   DiaryHomeScreenProvider({
//     Key? key,
//   }) : super(
//           key: key,
//           create: (context) => DiaryHomeScreenBloc(),
//           child: const DiaryHomeScreenView(

//           ),
//         );
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_view.dart';

class DiaryHomeScreenProvider extends StatelessWidget {
  final String name;

  const DiaryHomeScreenProvider({Key? key, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryHomeScreenBloc(),
      child: DiaryHomeScreenView(
        name: name,
      ),
    );
  }
}
