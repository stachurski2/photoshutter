import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';
import '../../router/router_cubit.dart';

class CounterPage extends StatelessWidget {

  CounterPage({super.key }) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
              BlocProvider<CounterCubit>(
                  create: (BuildContext context) => CounterCubit(),
              child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
              return Column(children: [
              Text("Counter:"),

              Text(state.counterValue.toString()),
              TextButton(onPressed: () =>
              {
              BlocProvider.of<CounterCubit>(context).increment()
              }, child: Text("increment me")),
              TextButton(onPressed: () =>
              {
              BlocProvider.of<CounterCubit>(context).decrement()
              }, child: Text("decrement me")),
                TextButton(onPressed: () =>
                {
                  context.read<RouterCubit>().popExtra()

                }, child: Text("close me"))
              ]);

              }
              )),
        ]) ));
  }

}