import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_central_repository_impl.dart';
import 'package:photoshutter/router/router_cubit.dart';
import 'package:focus_detector/focus_detector.dart';
import 'bloc/shutter_bloc.dart';

class ShutterPage extends StatelessWidget {
  const ShutterPage({super.key});

  @override
  Widget build(BuildContext context) => _ShutterPage();
}

class _ShutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<ShutterBloc>(
            create: (context) => ShutterBloc(
                bluetoothCentralRepository: BluetoothCentralRepositoryImpl()),
            child: BlocBuilder<ShutterBloc, ShutterState>(
                builder: (context, state) {
              return FocusDetector(
                  onVisibilityGained: () {
                    BlocProvider.of<ShutterBloc>(context)
                        .add(ShutterAppearEvent());
                    context.read<ShutterBloc>().add(ShutterAppearEvent());
                    BlocProvider.of<ShutterBloc>(context)
                        .add(ShutterListenConnectionEvent());
                    context
                        .read<ShutterBloc>()
                        .add(ShutterListenConnectionEvent());
                  },
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        const Text("isConnected:"),
                        Text(state.isConnected.toString()),
                        const Text("shutter"),
                        Text("Bluetooth active: ${state.isBluetoothActive}"),
                        if (state.isBluetoothActive == true &&
                            !state.isConnected) ...[
                          TextButton(
                              onPressed: () => {
                                    BlocProvider.of<ShutterBloc>(context)
                                        .add(ShutterScanEvent())
                                  },
                              child: const Text("scan devices")),
                          Column(
                              children: state.scannedDeviceList
                                  .map((scannedDevice) => Row(children: [
                                        const Spacer(),
                                        scannedDevice.connectable
                                            ? TextButton(
                                                onPressed: () => {
                                                      BlocProvider.of<
                                                                  ShutterBloc>(
                                                              context)
                                                          .add(
                                                              ShutterConnectEvent(
                                                                  scannedDevice
                                                                      .id))
                                                    },
                                                child: Text(scannedDevice.id))
                                            : Text(scannedDevice.id),
                                        const Spacer()
                                      ]))
                                  .toList()),
                        ] else if (state.isBluetoothActive == true &&
                            state.isConnected) ...[
                          const Text("connected"),
                          TextButton(
                              onPressed: () => {
                                    BlocProvider.of<ShutterBloc>(context)
                                        .add(ShutterDisconnectEvent())
                                  },
                              child: const Text("disconnect"))
                        ] else ...[
                          const Text("bluetooth not active"),
                        ],
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () =>
                                {context.read<RouterCubit>().popExtra()},
                            child: const Text("close me")),
                      ])));
            })));
  }
}
