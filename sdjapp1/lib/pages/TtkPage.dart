import 'package:flutter/material.dart';

class TtkPage extends StatelessWidget {
  const TtkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('通天閣'),
        ),
      ),
      body: const Center(
        child: Text('ttk'),
      ),
    );
  }
}