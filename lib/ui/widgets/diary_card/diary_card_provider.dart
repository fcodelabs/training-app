import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_view.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_bloc.dart';

class DiaryCardProvider extends StatelessWidget {
  const DiaryCardProvider(
      {Key? key,
      required String description,
      required String title,
      required String username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryCardBloc(),
      child: SignInPageView(),
    );
  }
}
