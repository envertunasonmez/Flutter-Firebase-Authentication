import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade800),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata, color: Colors.white, size: 30),
                SizedBox(width: 8),
                Text(
                  StringConstants.logInWithGoogle,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade800),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple, color: Colors.white, size: 30),
                SizedBox(width: 8),
                Text(
                  StringConstants.logInWithApple,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
