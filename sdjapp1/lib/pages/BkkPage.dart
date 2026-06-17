import 'package:flutter/material.dart';

class BkkPage extends StatelessWidget {
  const BkkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('万博記念公園'),
        ),
      ),
      body: const Center(
        child: Text('bkk'),
      ),
    );
  }
}