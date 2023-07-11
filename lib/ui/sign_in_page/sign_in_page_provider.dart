import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_bloc.dart';
import 'package:training_app/ui/sign_in_page/sign_in_page_view.dart';

class SignInPageProvider extends StatelessWidget {
  const SignInPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInPageBloc(),
      child: const SignInPageView(),
    );
  }
}
