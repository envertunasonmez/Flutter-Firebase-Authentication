import 'package:firebase_authentication/view/auth/register/widgets/email_field.dart';
import 'package:firebase_authentication/view/auth/register/widgets/password_field.dart';
import 'package:firebase_authentication/view/auth/register/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    FocusNode passwordFocusNode = FocusNode();
    FocusNode confirmPasswordFocusNode = FocusNode();

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.1),
              const Text(
                'Create your account ✨ ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenSize.height * 0.02),
              const Text(
                'Welcome! Please enter your details.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: screenSize.height * 0.03),
              EmailField(
                controller: emailController,
                nextFocusNode: passwordFocusNode,
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                nextFocusNode: confirmPasswordFocusNode,
                labelText: 'Password',
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                nextFocusNode: FocusNode(), 
                labelText: 'Confirm Password',
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus(); 
                },
              ),
              const SizedBox(height: 20),
              RegisterButton(
                onPressed: () {
                  // Register logic goes here
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
