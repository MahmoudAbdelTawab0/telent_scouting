import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/screens/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:Colors.green.shade400,
        body: Container(
          child: Column(
            children: [
              Spacer(),
              Center(
                child: SizedBox(
                  // width: 250.0,
                  // height: 200,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: false,
                    totalRepeatCount: 1,
                    onFinished: () {
                         Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: (context) => const OnBoarding()));
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'Talent Scouting',
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Kanit"
                          ),
                          curve: Curves.fastOutSlowIn,
                          speed: const Duration(milliseconds: 200)
                      ),
                    ],
                  ),
                ),
              ),
Spacer(),
              Image.asset("assets/images/img7-removebg-preview.png"),
            ],
          ),
        )
    );
  }
}