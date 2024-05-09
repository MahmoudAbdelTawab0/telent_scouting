import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/skills/dribbling_screen.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int pageNum = 0;

  final List<String> skills = ["PASSING", "DRIBBLING", "JUGGLING", "EGLTY"];

  final List<Widget> skillsPages = const [
    PassingScreen(),
    DribblingScreen(),
    JugglingScreen(),
    EgltyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.lightGreen,
          statusBarColor: Colors.lightGreen
        ),
        title: const Text(
          "Talent Scouting",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
            fontFamily:"Poppins"
          ),
        ),
        actions: const [
          Icon(Icons.sports_soccer,color: Colors.white,size: 30,),
          Icon(Icons.sports_handball,color: Colors.white,size: 30,),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ),
                  speed: const Duration(milliseconds: 300),
                  "Click on image to upload your vedio !!!!",
                  colors: [Colors.green, Colors.black, Colors.lightGreen, Colors.white],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  pageNum = value;
                });
              },
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => skillsPages[index]),
                        );
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            "assets/images/img_$index.png",
                            fit: BoxFit.values[0],
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 400,
                                width: 200,
                                color: Colors.lightGreen,
                              );
                            },
                          ),
                          Positioned(
                              bottom: 25,
                              left: 30,
                              child: Text(
                                skills[index],
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pageNum != 0
                  //<---
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _controller
                              .jumpToPage((_controller.page! - 1).toInt());
                        });
                      },
                      child: const Text(
                        "<---",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 38,
                    ),
              const SizedBox(
                width: 30,
              ),
              // ••••
              SmoothPageIndicator(
                controller: _controller,
                onDotClicked: (index) => _controller.jumpToPage(index),
                count: 4,
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  activeDotColor: Colors.lightGreen,
                  dotColor: Colors.grey.withOpacity(0.5),
                  dotHeight: 20,
                  dotWidth: 20,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              pageNum != 3
                  //--->
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInQuart,
                          );
                        });
                      },
                      child: const Text(
                        "--->",
                        style: TextStyle(
                          color: Colors.black87,
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    )
                  : const SizedBox(
                      width: 38,
                    ),
            ],
          )
        ],
      ),
    );
  }
}
