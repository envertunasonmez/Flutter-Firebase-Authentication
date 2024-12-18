import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_bloc.dart';
import 'package:firebase_authentication/cubit/password_visibility_cubit.dart';

class Providers {
  static List<BlocProvider> get providers {
    return [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<PasswordVisibilityCubit>(
        create: (context) => PasswordVisibilityCubit(),
      ),
    ];
  }  
}
