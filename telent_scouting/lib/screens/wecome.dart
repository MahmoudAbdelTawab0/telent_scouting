import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/pages.dart';

class WecomeScreen extends StatelessWidget {
  const WecomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
          width: 340,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/img_7.png"))
          ),

              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Pages()),);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff223263),
                          fixedSize: const Size(
                              200, // width
                              57 // height
                          )),
                      child: const Text('Next',style: TextStyle(color: Colors.white),),
                    ),
                    const SizedBox(width: 20,),
                    const Text("--->",
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
