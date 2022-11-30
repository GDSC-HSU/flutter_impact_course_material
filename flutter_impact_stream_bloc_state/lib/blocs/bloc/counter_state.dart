part of 'counter_bloc.dart';

class CounterState {
  final int counter;
  CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}
