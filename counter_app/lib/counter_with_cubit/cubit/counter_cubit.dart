import 'dart:developer';

import 'package:counter_app/counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;
  // logic

  add() {
    counter++;
    log('add()');
    emit(UpdateCounterState());
  }

  subtract() {
    counter--;
    log('remove()');
    emit(UpdateCounterState());
  }

  login() {
    // emit(loading);
    // call api check email and pass
    // > emit(success)
    // > emit(error)
  }
}

// OOP

// Poly.
// Person => Student && Doctor

// Person s = Student();
// CounterStates d = CounterInitialState();
