import 'package:bloc/bloc.dart' show Cubit;
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue > 0 ? state.counterValue - 1 : 0 ));
}