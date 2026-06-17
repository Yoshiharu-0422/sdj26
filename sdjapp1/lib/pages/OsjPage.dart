import 'package:flutter/material.dart';

class OsjPage extends StatelessWidget {
  const OsjPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('大阪城'),
        ),
      ),
      body: const Center(
        child: Text('osj'),
      ),
    );
  }
}