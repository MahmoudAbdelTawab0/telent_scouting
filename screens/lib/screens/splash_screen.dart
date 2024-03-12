import 'package:flutter/material.dart';
import 'package:screens/screens/bottom_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const MainScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff40BFFF),
        body: SafeArea(
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 72,
              width: 72,
            ),
          ),
        ));
  }
}
