import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'router_state.dart';
import 'router_cubit.dart';
import 'package:photoshutter/presentation/onboarding/onboarding_page.dart';
import 'package:photoshutter/presentation/counter/counter_page.dart';
import 'package:photoshutter/presentation/camera/camera_page.dart';
import 'package:photoshutter/presentation/shutter/shutter_page.dart';

class RootRouterDelegate extends RouterDelegate<RouterState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final RouterCubit _routerCubit;

  RootRouterDelegate(GlobalKey<NavigatorState> navigatorKey, RouterCubit routerCubit)
      : _navigatorKey = navigatorKey,
        _routerCubit = routerCubit;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) => Navigator(
    key: navigatorKey,
    pages: List.from([
      _materialPage(valueKey: "onboardingWidget", child:  const OnboardingPage(title: 'Flutter Demo Home Page')),
      ..._extraPages,
    ]),
    onPopPage: _onPopPageParser,
  );

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (_extraPages.isNotEmpty) {
      _routerCubit.popExtra();
      return true;
    }
    if (_routerCubit.state is! RouteOnboardingState) {
      _routerCubit.goCounter();
      return true;
    }
    return await _confirmAppExit();
  }

  Future<bool> _confirmAppExit() async =>
      await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text("Exit App"),
          content: const Text("Are you sure you want to exit the app?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ) ??
          true;


  List<Page> get _extraPages {
    if (_routerCubit.state is RouteCounterState) {
      return [
        _materialPage(valueKey: "counterPage", child: CounterPage())
      ];
    } else if (_routerCubit.state is RouteCameraState) {
      return [
        _materialPage(valueKey: "cameraPage", child: CameraPage())
      ];
    } else if (_routerCubit.state is RouteShutterState) {
      return [
        _materialPage(valueKey: "shutterState", child: ShutterPage())
      ];

    } else {
      return [];
    }
  }

  Page _materialPage({
    required String valueKey,
    required Widget child,
  }) =>
      MaterialPage(
        key: ValueKey<String>(valueKey),
        child: child,
      );
  //It's not needed for bloc/cubit
  @override
  void addListener(VoidCallback listener) {}

  //It's not needed for bloc/cubit
  @override
  void removeListener(VoidCallback listener) {}

  //It's not needed for now
  @override
  Future<void> setNewRoutePath(RouterState configuration) async {}
}