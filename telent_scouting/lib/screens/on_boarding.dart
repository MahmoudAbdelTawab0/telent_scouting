import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/home_screen.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/screens/pageview_onboarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();

  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                pageNum = value;
              });
            },
            children: [
              PageViewItem(
                image: "assets/images/img_6-removebg-preview.png",
                title: "TALENT SCOUTING",
                subtitle:
                    "It serves as a strategic compass that guides organizations towards identifying and nurturing individuals who possess the capacity to drive innovation, productivity, and success",
              ),
              PageViewItem(
                image: "assets/images/img_8-removebg-preview.png",
                title: "FIND YOUR OPPORTUNTTIY",
                subtitle:
                    "This can help you build a strong talent pipeline, cost and time management, and thus your employer brand",
              ),
              PageViewItem(
                image: "assets/images/img-removebg-preview.png",
                title: "ABOUT APPLIACTION",
                subtitle:
                    "It is an application that uses artificial intelligence to facilitate the process of discovering football talents and creating real opportunities for emerging players",
              ),
            ],
          ),
          Positioned(
              bottom: 150,
              left: 70,
              right: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      activeDotColor: Colors.green.shade400,
                      dotColor: Colors.black26,
                      dotHeight: 20,
                      dotWidth: 20,
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 100,
              right: 32,
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pages(),
                    ),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 14, color: Colors.black,fontWeight:FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              )),
          Positioned(
            left: 60,
            right: 60,
            bottom: 70,
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:  Colors.green.shade400,
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {
                    if (pageNum == 2) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Pages()));
                    }
                    _controller.nextPage(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.easeIn);
                  },
                  child: Center(
                    child: Text(
                      pageNum == 2 ? "Get Started" : "Next",
                      style:  TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
