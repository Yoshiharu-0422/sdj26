import 'package:flutter/material.dart';

class UmsPage extends StatelessWidget {
  const UmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('梅田スカイビル'),
        ),
      ),
      body: const Center(
        child: Text('ums'),
      ),
    );
  }
}