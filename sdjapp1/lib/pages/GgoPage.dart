import 'package:flutter/material.dart';

class GgoPage extends StatelessWidget {
  const GgoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('グラングリーン大阪'),
        ),
      ),
      body: const Center(
        child: Text('Ggo'),
      ),
    );
  }
}