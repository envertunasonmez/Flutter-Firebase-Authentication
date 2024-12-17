import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_event.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final FocusNode passwordFocusNode = FocusNode();
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: screenSize.height * 0.01),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'Enter your email',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.black,
            filled: true,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
        ),
        const SizedBox(height: 20),
        const Text('Password',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: screenSize.height * 0.01),
        TextFormField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock_outline_rounded),
            hintText: '* * * * * * * *',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.black,
            filled: true,
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            context.read<LoginBloc>().add(
                  SubmitLoginEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenSize.height * 0.01, left: screenSize.width * 0.6),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text('Forgot Password',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
