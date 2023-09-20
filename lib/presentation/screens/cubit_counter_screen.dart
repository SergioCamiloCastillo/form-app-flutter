import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit contador'),
      ),
      body: Center(
        child: const Text('Counter value'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [FloatingActionButton(heroTag: "1", onPressed: () {})],
      ),
    );
  }
}
