import 'package:cart_cubit/Bloc/cart_cubit.dart';
import 'package:cart_cubit/screen/HomeSceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.cyan
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
