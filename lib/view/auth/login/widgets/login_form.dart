import 'package:firebase_authentication/cubit/password_visibility_cubit.dart';
import 'package:firebase_authentication/products/constants/string_constants.dart';
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
    final FocusNode emailFocusNode = FocusNode();
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringConstants.email,
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: screenSize.height * 0.01),
        TextFormField(
          controller: emailController,
          focusNode: emailFocusNode, // FocusNode eklenmiş
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: StringConstants.enterYourEmail,
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.black,
            filled: true,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            // Email alanından password alanına geçiş
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
        ),
        const SizedBox(height: 20),
        Text(StringConstants.password,
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: screenSize.height * 0.01),
        BlocBuilder<PasswordVisibilityCubit, bool>(
          builder: (context, isPasswordVisible) {
            return TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode, // FocusNode eklenmiş
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context
                        .read<PasswordVisibilityCubit>()
                        .togglePasswordVisibility();
                  },
                ),
                hintText: '* * * * * * * *',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(),
              ),
              obscureText: !isPasswordVisible,
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
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenSize.height * 0.01, left: screenSize.width * 0.6),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(StringConstants.forgotPassword,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
