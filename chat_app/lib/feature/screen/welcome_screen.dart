import 'package:chat_app/core/app_color.dart';
import 'package:chat_app/feature/wigdets/button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(

              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16),),

                  ),

                  height: 180,
                 child: Image.asset("assets/images/chat_imge.jpg"),
                ),
                Text("ChatApp",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily:"DancingScript",
                  fontWeight: FontWeight.w900
                ),
                ),
                SizedBox(height: 30,),
                Button(color: Colors.yellow[900]!, title: "Sign in", onPressed:() {}),
                Button(color: Colors.blue[800]!, title: "Register", onPressed:() {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
