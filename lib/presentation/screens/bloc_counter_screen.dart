import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('Bloc contador ${counterBloc.state.transactionCounter}'),
        ),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().add(CounterReset()),
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('Counter value ${counterBloc.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () => increaseCounterBy(context, 3),
            child: Text('+3'),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: "2",
              onPressed: () => increaseCounterBy(context, 2),
              child: Text('+2')),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: "3",
              onPressed: () => increaseCounterBy(context, 1),
              child: Text('+1'))
        ],
      ),
    );
  }
}
