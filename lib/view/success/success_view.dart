import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Text('firebase authentication işlemi başarılı'),
      ),
    );
  }
}
