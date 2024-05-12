import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';
import 'package:telent_scouting/screens/about_us.dart';
import 'package:telent_scouting/screens/login_screen.dart';
import 'package:telent_scouting/screens/profile.dart';
import 'package:telent_scouting/screens/skills/dribbling_screen.dart';
import 'package:telent_scouting/screens/wecome.dart';

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
            statusBarColor: Colors.lightGreen),
        title: const Text(
          "Talent Scouting",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w800,
              fontFamily: "Poppins"),
        ),
        actions: const [
          Icon(
            Icons.sports_soccer,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.sports_handball,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.lightGreen,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser?.photoURL ??
                          "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName ??
                        "Anonymous User",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        fontSize: 25,
                        fontFamily: "poppins",
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutUs()));
              },
            ),
            FirebaseAuth.instance.currentUser == null
                ? ListTile(
                    leading: const Icon(Icons.arrow_back),
                    title: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                  )
                : ListTile(
                    leading: const Icon(Icons.arrow_back),
                    title: const Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
          ],
        ),

      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Hint text //
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w900),
                  speed: const Duration(milliseconds: 200),
                  "Click on image to upload your video !",
                  colors: [Colors.green, Colors.black, Colors.white],
                ),
              ],
            ),
          ),
          // Page View ◘◘◘//
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
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(60, 10, 40, 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.center,
                                child: skillsPages[index],
                                type: PageTransitionType.size,
                                childCurrent: const Pages(),
                                duration: const Duration(seconds: 1)),
                          );
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Image.asset(
                                "assets/images/img_$index.png",
                                fit: BoxFit.values[0],
                                height: 500,
                                width: 300,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 500,
                                    width: 300,
                                    color: Colors.lightGreen,
                                  );
                                },
                              ),
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
                  ),
                );
              },
            ),
          ),
          // Page indicator •••• //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          )
        ],
      ),
    );
  }
}
