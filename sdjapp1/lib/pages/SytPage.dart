import 'package:flutter/material.dart';

class SytPage extends StatelessWidget {
  const SytPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('住吉大社'),
        ),
      ),
      body: const Center(
        child: Text('syt'),
      ),
    );
  }
}