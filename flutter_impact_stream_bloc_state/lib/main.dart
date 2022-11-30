import 'package:flutter/material.dart';
import 'package:flutter_impact_stream_bloc_state/blocs/bloc/counter_bloc.dart';
import 'package:flutter_impact_stream_bloc_state/cli_stream_demo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final StreamDemo streamDemo = StreamDemo();

printStreamNumber(num) {
  print("[DEV]" + num.toString());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();
  void _incrementCounter() {
    _counterBloc.add(CounterIncrementEvent());
  }

  void _decrementCounter() {
    _counterBloc.add(CounterDecrementEvent());
  }

  void _doubleCounter() {
    _counterBloc.add(CounterDoubleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
            BlocBuilder<CounterBloc, CounterState>(
                bloc: _counterBloc,
                builder: (context, state) {
                  return Text(state.counter.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 55));
                }),
            Wrap(
              children: [
                ElevatedButton(
                    onPressed: () {
                      this._incrementCounter();
                    },
                    child: const Text("+ Increment Counter")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      this._decrementCounter();
                    },
                    child: const Text("- Decrement Counter")),
                ElevatedButton(
                    onPressed: () {
                      this._doubleCounter();
                    },
                    child: const Text("x2 Double Counter"))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
