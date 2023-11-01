import 'package:flutter/material.dart';
import 'package:photoshutter/router/router_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => _OnboardingPage();
}

class _OnboardingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: [
            Column(children: [
              TextButton(onPressed: () =>
              {
                context.read<RouterCubit>().goCounter()
              }, child: Text("Go as a counter")),
              TextButton(onPressed: () =>
              {
                context.read<RouterCubit>().goCamera()
              }, child: Text("Go as a camera")),
              SizedBox(height: 10),
              TextButton(onPressed: () =>
              {
                context.read<RouterCubit>().goShutter()
              }, child: Text("Go as a shutter"),)
            ])
          ])
        ])
    ));
  }
}
