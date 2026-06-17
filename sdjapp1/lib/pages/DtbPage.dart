import 'package:flutter/material.dart';

class DtbPage extends StatelessWidget {
  const DtbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('道頓堀'),
        ),
      ),
      body: const Center(
        child: Text('dtb'),
      ),
    );
  }
}