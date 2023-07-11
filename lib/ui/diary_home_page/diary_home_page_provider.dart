import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_bloc.dart';
import 'package:training_app/ui/diary_home_page/diary_home_page_view.dart';

class DiaryHomePageProvider extends StatelessWidget {
  final String name;

  const DiaryHomePageProvider({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryHomePageBloc(),
      child: DiaryHomePageView(
        name: name,
      ),
    );
  }
}
