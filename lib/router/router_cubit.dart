import 'router_state.dart';
import 'package:bloc/bloc.dart';

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