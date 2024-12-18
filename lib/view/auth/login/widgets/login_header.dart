import 'package:firebase_authentication/products/constants/string_constants.dart';
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
        Text(
          StringConstants.logInToYourAccount,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          StringConstants.welcomeBack,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: screenSize.height * 0.03),
      ],
    );
  }
}
