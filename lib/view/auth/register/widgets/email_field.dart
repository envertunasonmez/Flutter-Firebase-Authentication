import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode nextFocusNode;

  const EmailField({
    super.key,
    required this.controller,
    required this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.email,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: screenSize.height * 0.01),
        TextFormField(
          controller: controller,
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
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
        ),
      ],
    );
  }
}
