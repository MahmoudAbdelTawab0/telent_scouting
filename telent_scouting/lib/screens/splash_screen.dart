import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telent_scouting/Screens/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/img_9.png"))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SizedBox(
                width: 250.0,
                height: 200,
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: false,
                  totalRepeatCount: 1,
                  onFinished: () {
                      Navigator.of(context).pushReplacement(
                       MaterialPageRoute(builder: (context) => const Pages()));
                  },
                  animatedTexts: [
                    TypewriterAnimatedText(
                        'Welcome to Talent Scouting',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: "poppins"
                      ),
                      curve: Curves.fastOutSlowIn,
                      speed: const Duration(milliseconds: 200)
                    ),
                  ],
                ),
              ),
          ]
    )
      )
    );
  }
}
