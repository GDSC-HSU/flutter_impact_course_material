part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterDoubleEvent extends CounterEvent {}

class CounterDividedEvent extends CounterEvent {}
