import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // Initial value = 0

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CubitCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit Counter")),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            return Text(
              'Count: $count',
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => context.read<CounterCubit>().increment(),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}