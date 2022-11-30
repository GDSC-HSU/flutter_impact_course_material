part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterLoadSusses extends CounterState {
  final int counterNumber;

  CounterLoadSusses({required this.counterNumber});
}

class CounterLoadFailure extends CounterState {
  final String mess;

  CounterLoadFailure(this.mess);
}
