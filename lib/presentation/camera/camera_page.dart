
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoshutter/router/router_cubit.dart';

class CameraPage extends StatelessWidget {
@override
Widget build(BuildContext context) => _CameraPage();
}

class _CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text("camera"),
          SizedBox(height: 10,),
          TextButton(onPressed: () => {
            context.read<RouterCubit>().popExtra()
          }, child: Text("close me")),
        ])));
  }
}