import 'package:conter_app/bloc/counter_cubit.dart';
import 'package:conter_app/screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
  builder: (context, state) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: CounterScreen(),
      );
  },
),
    );
  }
}

