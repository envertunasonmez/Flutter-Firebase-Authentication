import 'package:firebase_authentication/products/constants/string_constants.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.1),
              Text(
                StringConstants.createYourAccount,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                StringConstants.welcome,
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
                labelText: StringConstants.password,
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                nextFocusNode: FocusNode(),
                labelText: StringConstants.confirmPassword,
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
                  Text(
                    StringConstants.alreadyHaveAnAccount,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: Text(
                      StringConstants.logIn,
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
