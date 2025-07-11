import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/counter.dart';
import '../../domain/usecases/increment_counter.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class CounterState {
  final Counter counter;

  CounterState(this.counter);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;

  CounterBloc(this.incrementCounter)
      : super(CounterState(Counter(0))) {
    on<IncrementCounterEvent>((event, emit) {
      final newCounter = incrementCounter();
      emit(CounterState(newCounter));
    });
  }
}