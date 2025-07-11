import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class IncrementCounter {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  Counter call() {
    return repository.increment();
  }
}