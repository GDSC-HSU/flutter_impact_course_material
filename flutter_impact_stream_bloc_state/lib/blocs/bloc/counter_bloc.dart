import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  var counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      print(event);
      print("Hello CounterBloc");
      counter++;
      print(counter);
      emit(CounterState(counter));
    });

    on<CounterDecrementEvent>((event, emit) {
      print(event);
      print("Hello CounterBloc");
      counter--;
      print(counter);
      emit(CounterState(counter));
    });

    on<CounterDoubleEvent>((event, emit) {
      print(event);
      print("Hello CounterBloc");
      counter = counter * 2;
      print(counter);
      emit(CounterState(counter));
    });

    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
