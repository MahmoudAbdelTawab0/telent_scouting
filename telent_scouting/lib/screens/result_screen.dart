import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color primeColor = Colors.green.shade400;
Color secondColor = Colors.green.shade900;


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Result();

  }
}
class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(

                padding: EdgeInsets.only(
                  top:16.0,
                  right:16.0,
                  left:16.0,
                ),
                // height: MediaQuery.of(context).size.height*0.4,

                decoration: BoxDecoration(
                  color: primeColor,

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),

                  ),
                ),

                child: Column(
                    children:[
                      SizedBox(height: 20),
                      Column(
                          children:[

                            CircleAvatar(
                              radius: 70,
                              backgroundColor: secondColor,
                              child: Icon(Icons.person, size: 50, color: Colors.white),
                            ),


                            Column(children: [
                              Text(
                                'John Doe',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    Column(children: [
                                      Text('age: 12'),
                                      Text('Cairo'),
                                    ],),
                                    SizedBox(width: 8),
                                    Column(children: [
                                      Text('age: 12'),
                                      Text('Cairo'),

                                    ],),


                                  ])


                            ],)
                          ]
                      ),
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child:
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: 47/50,
                                backgroundColor: Colors.white,
                                strokeWidth: 16,

                                valueColor: AlwaysStoppedAnimation<Color>(secondColor),
                              ),
                            ),
                            Text(
                              '47',
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ],
                        ),
                        // Text(
                        //   '47',
                        //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                        // ),
                      ),


                    ]),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 20),
                child: Column(children:
                [
                  Row(children: [
                    skillProgress("juggling",0.8),
                    SizedBox(width: 20),
                    skillProgress("passing",0.8),
                  ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround
                  ),
                  SizedBox(height: 20),
                  Row(children: [
                    skillProgress("agility",0.8),
                    SizedBox(width: 20),
                    skillProgress("dribbling",0.8),
                  ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround
                  ),
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}

Widget skillProgress(String skill, double value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(skill, style: TextStyle(fontSize: 18, color: Colors.black)),
        SizedBox(width: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.white,
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(secondColor),
              ),
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}