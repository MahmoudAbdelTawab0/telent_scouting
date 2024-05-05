import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
int value = 0;

  void Zero(){
    value =0;

    emit(CounterChnage());
  }
void InecrementOne(){
  value++;

  emit(CounterChnage());
}

  void InecrementTen(){
    value+=2;

    emit(CounterChnage());
  }
  void DenecrementTen(){
    value+=3;

    emit(CounterChnage());
  }
}
