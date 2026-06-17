import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AbhPage extends StatelessWidget {
  const AbhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('あべのハルカス'),
        ),
      ),
      body: Center(
        child: Text('good')
      ),
    );
  }
}