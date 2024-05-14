import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Work'),
      ),
      body: const Center(
        child: SizedBox(
          child: Text("Welcome "),
        ),
      ),
    );
  }
}
