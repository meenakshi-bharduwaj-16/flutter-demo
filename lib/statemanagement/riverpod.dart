import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void increment() => state = (state*10);
}

// Create the provider
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() => CounterNotifier());


class RiverpodCounterScreen extends ConsumerWidget {
  const RiverpodCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to rebuild when the value changes
    //final count = ref.watch(counterProvider);
    final count = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter'),
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update the state
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterNotifierProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}