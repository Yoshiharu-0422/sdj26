import 'package:flutter/material.dart';

class KmsPage extends StatelessWidget {
  const KmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('黒門市場'),
        ),
      ),
      body: const Center(
        child: Text('kms'),
      ),
    );
  }
}