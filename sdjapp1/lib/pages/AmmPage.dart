import 'package:flutter/material.dart';

class AmmPage extends StatelessWidget {
  const AmmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('アメリカ村'),
        ),
      ),
      body: const Center(
        child: Text('Amm'),
      ),
    );
  }
}