import 'package:flutter/material.dart';

class TedPage extends StatelessWidget {
  const TedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('天王寺動物園'),
        ),
      ),
      body: const Center(
        child: Text('Ten'),
      ),
    );
  }
}