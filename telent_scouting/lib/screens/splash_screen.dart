import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telent_scouting/Screens/wecome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const WecomeScreen()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/img_6.png"))),
              ),
            ),
            const SizedBox(height: 100,),
            SizedBox(
              width: 250.0,
              height: 200,
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: false,
                totalRepeatCount: 1,
                onFinished: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const WecomeScreen()));
                },
                animatedTexts: [
                  TypewriterAnimatedText(
                      'Welcome to Talent Scouting',
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    curve: Curves.fastOutSlowIn,
                    speed: const Duration(milliseconds: 100)
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
