import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/login_page/login_page_view.dart';

import 'login_page_bloc.dart';

class LoginPageProvider extends BlocProvider<LoginPageBloc> {
  LoginPageProvider({
    Key? key,
  }) : super(
          key: key,
          create: (context) => LoginPageBloc(tempNameController: TextEditingController()),
          child: LoginScreenView(),
        );
}