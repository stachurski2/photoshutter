import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoshutter/presentation/camera/bloc/camera_bloc.dart';
import 'package:photoshutter/repository/bluetoothPeripheralRepository/bluetooth_peripheral_repository_impl.dart';
import 'package:photoshutter/router/router_cubit.dart';
import 'package:focus_detector/focus_detector.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) => _CameraPage();
}

class _CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<CameraBloc>(
          create: (context) => CameraBloc(
            bluetoothPeripheralRepository: BluetoothPeripheralRepositoryImpl(),
          ),
          child: BlocBuilder<CameraBloc, CameraState>(
            builder: (context, state) {
              return FocusDetector(
                onVisibilityGained: () {
                  BlocProvider.of<CameraBloc>(context).add(CameraAppearEvent());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("camera"),
                    Text("Bluetooth active: ${state.isBluetoothActive}"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () => {
                        context.read<RouterCubit>().popExtra(),
                      },
                      child: const Text("close me"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
