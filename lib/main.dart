import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';
import 'mytext.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          centerTitle: true,
          toolbarHeight: 100,
          shadowColor: Colors.yellow,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    CounterNotifier counterController = ref.watch(counterProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MyText(text: "Aupa hey"),
              Text(
                ref.watch(normalProvider),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ref.watch(messageProvider).when(
                    data: (message) => Text(
                      message,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) => Text(
                      'Error: $error',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
              Text("Counter $counter",
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              // first FAB to perform decrement
              onPressed: counterController.increment,
              tooltip: 'Increment',
              child: Icon(Icons.delete),
            ),
            FloatingActionButton(
              // second FAB to perform increment
              onPressed: counterController.decrement,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
