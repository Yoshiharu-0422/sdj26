import 'package:flutter/material.dart';

class TrbPage extends StatelessWidget {
  const TrbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('チームラボボタニカルガーデン 大阪'),
        ),
      ),
      body: const Center(
        child: Text('Trb'),
      ),
    );
  }
}