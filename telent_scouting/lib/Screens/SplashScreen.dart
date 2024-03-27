// 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/HomeScreen.dart';
import 'package:telent_scouting/Screens/LoginScreen.dart';
import 'package:telent_scouting/Screens/Pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      if (FirebaseAuth.instance.currentUser == null){
        Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
            builder:(context) => Login())
        );
      }else{
        Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
            builder:(context) => Pages()));
      }
    }) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Image.asset("assets/images/img_1.png",
        width: 100,
          height: 100,
        ),
      ),
    );
  }
}
