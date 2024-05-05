
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/Profile.dart';
import 'package:telent_scouting/Screens/skills/drubbling_screen.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Home"),

),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(10, 10),
                              blurRadius: 20
                            )
                          ]
                        ),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PassingScreen()),);
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/images/img.png",
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    bottom: 25,
                                    left: 30,
                                    child: Text(
                                      "PASSING",
                                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          )),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(10, 10),
                                  blurRadius: 20
                              )
                            ]
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DrubblingScreen()),);

                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "assets/images/img_1.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 30,
                                  child: Text(
                                    "DRUBBLING4",
                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(10, 10),
                                  blurRadius: 20
                              )
                            ]
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => JugglingScreen()),);

                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "assets/images/img_2.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 30,
                                  child: Text(
                                    "JUGGLING",
                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(10, 10),
                                  blurRadius: 20
                              )
                            ]
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EgltyScreen()),);

                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "assets/images/img_4.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 30,
                                  child: Text(
                                    "EGLTY",
                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),

              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.grey.withOpacity(0.5),
                dotHeight: 20,
                dotWidth: 20,
            ),
          )
        ],
      ),
    );
  }
}
