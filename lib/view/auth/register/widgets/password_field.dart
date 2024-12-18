import 'package:flutter/material.dart';

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
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            hintText: 'Enter your password',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.black,
            filled: true,
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
