import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'root_router_dalegate.dart';
import 'router_cubit.dart';

class AppRoot extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterCubit(),
      child: MaterialApp(
        home: _router,
      ),
    );
  }

  Widget get _router {
    return BlocBuilder<RouterCubit, RouterState>(
      builder: (context, state) {
        return Router(
          routerDelegate: RootRouterDelegate(
            navigatorKey,
            context.read<RouterCubit>(),
          ),
          backButtonDispatcher: RootBackButtonDispatcher(),
        );
      },
    );
  }
}
