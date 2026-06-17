import 'package:flutter/material.dart';

class StjPage extends StatelessWidget {
  const StjPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('四天王寺'),
        ),
      ),
      body: const Center(
        child: Text('stj'),
      ),
    );
  }
}