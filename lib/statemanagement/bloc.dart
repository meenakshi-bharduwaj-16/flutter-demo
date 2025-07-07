import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class PrintEvent extends CounterEvent {
  final String text;
  PrintEvent(this.text);
}

class PrintBloc extends Bloc<PrintEvent, String> {
  PrintBloc() : super("") {
    on<PrintEvent>((event, emit) {
      //update state
      emit(state + event.text);
    });
  }
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      //update state
      emit(state + 1);
    });
  }
}

class BlocCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read</*CounterBloc*/PrintBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Counter')),
      body: Center(
        child: BlocBuilder</*CounterBloc*/PrintBloc, /*int*/String>(
          builder: (context, count) {
            return Text(
              'Count: $count',
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.add(/*IncrementEvent()*/PrintEvent("Hello")),
        child: Icon(Icons.add),
      ),
    );
  }
}
