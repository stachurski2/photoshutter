import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoshutter/router/router_cubit.dart';

class ShutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _ShutterPage();
}

class _ShutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text("shutter"),
          SizedBox(height: 10,),
          TextButton(onPressed: () => {
            context.read<RouterCubit>().popExtra()q22qqqqqqqqqq   q q q q1ci ibhgn
          }, child: Text("close me")),
        ])));
  }
}