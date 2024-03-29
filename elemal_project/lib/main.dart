import 'package:elemal_project/cubits/categories_cubit.dart';
import 'package:elemal_project/screen/home_screen.dart';
import 'package:elemal_project/screen/pages.dart';
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
      create: (context) => CategoriesCubit(),
      child: MaterialApp(
        //theme: ThemeData(

        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
        //  ),
        debugShowCheckedModeBanner: false,
        home: Pages(),
      ),
    );
  }
}
