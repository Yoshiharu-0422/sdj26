import 'package:flutter/material.dart';

class MfiPage extends StatelessWidget {
  const MfiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('百舌鳥・古市古墳群'),
        ),
      ),
      body: const Center(
        child: Text('mfi'),
      ),
    );
  }
}