import 'package:firebase_authentication/products/constants/asset_constants.dart';
import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          StringConstants.loginSuccesful,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringConstants.congratulations,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Center(child: Image.asset(AssetConstants.dash)),
          ],
        ),
      ),
    );
  }
}
