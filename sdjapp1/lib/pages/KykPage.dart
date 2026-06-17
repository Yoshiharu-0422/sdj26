import 'package:flutter/material.dart';

class KykPage extends StatelessWidget {
  const KykPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('海遊館'),
        ),
      ),
      body: const Center(
        child: Text('kyk'),
      ),
    );
  }
}