import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/HomeScreen.dart';
import 'package:telent_scouting/Screens/LoginScreen.dart';
import 'package:telent_scouting/Screens/Pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:telent_scouting/Screens/Profile.dart';
import 'package:telent_scouting/Screens/SplashScreen.dart';
import 'package:telent_scouting/Screens/wecome.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: WecomeScreen(),
    );
  }
  }