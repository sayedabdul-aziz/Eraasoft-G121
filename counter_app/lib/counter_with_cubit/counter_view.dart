import 'package:counter_app/counter_with_cubit/cubit/counter_cubit.dart';
import 'package:counter_app/counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Counter App'),
        ),
        body: BlocConsumer<CounterCubit, CounterStates>(
            listener: (context, state) {
          // log('listen');
          // if (state is UpdateCounterState) {
          //   log('update counter');
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(const SnackBar(content: Text('Updated')));
          // } else {
          //   log('No state');
          // }
        }, builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<CounterCubit>().counter.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        context.read<CounterCubit>().subtract();
                        // BlocProvider.of<CounterCubit>(context).subtract();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        context.read<CounterCubit>().add();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
