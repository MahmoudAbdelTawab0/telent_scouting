import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/HomeScreen.dart';
import 'package:telent_scouting/Screens/Pages.dart';

class WecomeScreen extends StatelessWidget {
  const WecomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
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
                height: 30,
              ),
              Container(
                height: 400,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/img_7.png"))
          ),

              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Pages()),);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff223263),
                          fixedSize: Size(
                              200, // width
                              57 // height
                          )),
                      child: const Text('Next',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    Text("--->",
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),
                    )//
                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}
