import 'package:flutter/material.dart';

class WecomeScreen extends StatelessWidget {
  const WecomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Telent Scouting',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff223263),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            width: 300,
            child: Image.asset("assets/images/img_6.png"),
          )
        ],
      ),
    );
  }
}
