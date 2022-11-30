import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  var counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 1));
      print(event);
      print("Hello CounterBloc");
      counter++;
      print(counter);
      emit(CounterLoadSusses(counterNumber: counter));
    });

    on<CounterDecrementEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 1));
      print(event);
      print("Hello CounterBloc");
      counter--;
      print(counter);
      emit(CounterLoadSusses(counterNumber: counter));
    });

    on<CounterDoubleEvent>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 1));
      print(event);
      print("Hello CounterBloc");
      counter = counter * 2;
      print(counter);
      emit(CounterLoadSusses(counterNumber: counter));
    });

    on<CounterDividedEvent>((event, emit) {
      /// bunnies logic
      print(event);
      print("Hello CounterBloc");

      try {
        counter = int.parse((counter / 0).toString());
        print(counter);
        emit(CounterLoadSusses(counterNumber: counter));
      } catch (e) {
        emit(CounterLoadFailure(e.toString()));
      }
    });
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
