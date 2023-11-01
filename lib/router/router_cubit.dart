import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouteOnboardingState());

  void goCounter([String? text]) => emit(RouteCounterState(text));

  void goCamera([String? text]) => emit(RouteCameraState(text));

  void goShutter([String? text]) => emit(RouteShutterState(text));

  void popExtra()  {
    if(state is RouteCounterState) {
      emit(const RouteOnboardingState());
    } else if (state is RouteCameraState) {
      emit(const RouteOnboardingState());
    } else if (state is RouteShutterState) {
      emit(const RouteOnboardingState());
    }
  }
}