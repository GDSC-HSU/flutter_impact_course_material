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

  void _dividedCounter() {
    _counterBloc.add(CounterDividedEvent());
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
            BlocBuilder<CounterBloc, CounterState>(
                bloc: _counterBloc,
                builder: (context, state) {
                  if (state is CounterLoadFailure) {
                    return Text(state.mess,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 22, color: Colors.redAccent));
                  }
                  return Container();
                }),
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
                  print(state);
                  if (state is CounterLoadSusses) {
                    return Text(state.counterNumber.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 55));
                  }
                  // InitialBlocState

                  if (state is CounterLoading) {
                    return CircularProgressIndicator();
                  }

                  if (state is CounterLoadFailure) {
                    return Text("Error",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: 55));
                  }

                  // LoadingBlocState
                  return Container(
                    width: 50,
                    height: 20,
                    color: Colors.red,
                  );
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
                    child: const Text("x2 Double Counter")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      this._dividedCounter();
                    },
                    child: const Text("Divided Counter"))
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
