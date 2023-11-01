import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_central_repository_impl.dart';
import 'package:photoshutter/router/router_cubit.dart';
import 'package:focus_detector/focus_detector.dart';
import 'bloc/shutter_bloc.dart';

class ShutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _ShutterPage();
}

class _ShutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocProvider<ShutterBloc>(
        create: (context) => ShutterBloc(bluetoothCentralRepository: BluetoothCentralRepositoryImpl()),
        child:
        BlocBuilder<ShutterBloc, ShutterState>(
        builder: (context, state) {
    
     return FocusDetector(
          onVisibilityGained: (){
            BlocProvider.of<ShutterBloc>(context).add(ShutterAppearEvent());
            context.read<ShutterBloc>().add(ShutterAppearEvent());

          },
          child:
         Center(child:
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text("shutter"),
          Text("Bluetooth active: " + state.didBluetoothStart.toString()),
          SizedBox(height: 10,),
          TextButton(onPressed: () => {
            context.read<RouterCubit>().popExtra()
          }, child: Text("close me")),
        ])));})));
  }
}