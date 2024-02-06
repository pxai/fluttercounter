import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalProvider = Provider<String>((ref) {
  return 'Hello, World! provider';
});

final messageProvider = FutureProvider<String>((ref) async {
  return Future.delayed(const Duration(seconds: 2), () {
    return 'Hello, World! FutureProvider';
  });
});

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
