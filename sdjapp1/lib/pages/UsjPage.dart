import 'package:flutter/material.dart';

class UsjPage extends StatelessWidget {
  const UsjPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('USJ'),
        ),
      ),
      body: const Center(
        child: Text('usj'),
      ),
    );
  }
}