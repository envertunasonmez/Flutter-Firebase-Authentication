import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height * 0.1),
        const Text(
          'Log in to your account ✨ ',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenSize.height * 0.02),
        const Text(
          'Welcome back! Please enter your details',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: screenSize.height * 0.03),
      ],
    );
  }
}
