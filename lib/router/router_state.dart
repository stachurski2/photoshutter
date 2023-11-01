import 'package:equatable/equatable.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object?> get props => [];
}

class RouteOnboardingState extends RouterState {
  final String? extraPageContent;
  const RouteOnboardingState([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class RouteCounterState extends RouterState {
  final String? extraPageContent;
  const RouteCounterState([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class RouteCameraState extends RouterState {
  final String? extraPageContent;
  const RouteCameraState([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class RouteShutterState extends RouterState {
  final String? extraPageContent;
  const RouteShutterState([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

