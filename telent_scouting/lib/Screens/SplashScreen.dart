// 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/HomeScreen.dart';
import 'package:telent_scouting/Screens/LoginScreen.dart';
import 'package:telent_scouting/Screens/Pages.dart';
import 'package:telent_scouting/Screens/wecome.dart';

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
      Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
            builder:(context) => WecomeScreen()));

    }) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img_6.png"))
          ),

        ),

        ),

    );
  }
}
