import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc contador'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: const Text('Counter value'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {},
            child: Text('+3'),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: "2", onPressed: () {}, child: Text('+2')),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: "3", onPressed: () {}, child: Text('+1'))
        ],
      ),
    );
  }
}
