import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _counter = 0;

  @override
  Counter getCounter() {
    return Counter(_counter);
  }

  @override
  Counter increment() {
    _counter++;
    return Counter(_counter);
  }
}