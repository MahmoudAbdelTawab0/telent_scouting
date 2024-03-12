import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cubit/new_cubit/news_cubit.dart';
import 'package:news_api_cubit/screens/ArtcleScreen.dart';
import 'package:news_api_cubit/screens/SpleeshScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: SpleeshScreen(),
      ),
    );
  }
}
