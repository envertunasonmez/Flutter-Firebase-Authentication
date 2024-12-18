import 'package:firebase_authentication/view/auth/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication/bloc/auth/login/login_bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/social_login_buttons.dart';
import 'widgets/register_link.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.06),
          child: BlocProvider(
            create: (_) => LoginBloc(FirebaseAuth.instance),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is LoginSuccessState) {
                  context.go('/success');
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeader(),
                  LoginForm(),
                  LoginButton(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 16),
                  SocialLoginButtons(),
                  SizedBox(height: 20),
                  RegisterLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
