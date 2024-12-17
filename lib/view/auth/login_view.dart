import 'package:firebase_authentication/bloc/auth/login/login_bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_event.dart';
import 'package:firebase_authentication/bloc/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    FocusNode passwordFocusNode = FocusNode();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is LoginSuccessState) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                const Text(
                  'Log in to your account ✨ ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                const Text(
                  'Welcome back! Please enter your details',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: 24),
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 4),
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
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
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
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, left: 240.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue,
                            Colors.purple
                          ], // Gradient colors
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                SubmitLoginEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Make button background transparent
                          shadowColor: Colors.transparent, // Remove shadow
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
