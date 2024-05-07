import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/skills/dribbling_screen.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int pageNum = 0;

  final List<String> skills = ["PASSING", "DRIBBLING", "JUGGLING", "EGLTY"];

  final List<Widget> skillsPages = [
    PassingScreen(),
    const DribblingScreen(),
    JugglingScreen(),
    EgltyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  ""
                ),
              ],
          ),
          const Text(
            "Click on image to upload your vedio !!!!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                  child: Hero(
                    tag: "p",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(10, 10),
                              blurRadius: 20,
                            )
                          ]),
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
                          )),
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
