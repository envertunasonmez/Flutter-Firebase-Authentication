import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_authentication/cubit/password_visibility_cubit.dart'; // Cubit import

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String labelText;
  final ValueChanged<String>? onFieldSubmitted;

  const PasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocusNode,
    required this.labelText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, isPasswordVisible) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: screenSize.height * 0.01),
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: StringConstants.enterYourPassword,
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.black,
                filled: true,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Toggle password visibility
                    context
                        .read<PasswordVisibilityCubit>()
                        .togglePasswordVisibility();
                  },
                ),
              ),
              obscureText:
                  !isPasswordVisible, // Show or hide password based on cubit state
              style: const TextStyle(color: Colors.white),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: onFieldSubmitted,
            ),
          ],
        );
      },
    );
  }
}
