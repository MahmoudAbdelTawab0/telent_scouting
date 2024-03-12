import 'package:flutter/material.dart';
import 'package:news_api/screens/ArtcleScreen.dart';
import 'package:news_api/screens/SpleeshScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: SpleeshScreen(),
    );
  }
}
