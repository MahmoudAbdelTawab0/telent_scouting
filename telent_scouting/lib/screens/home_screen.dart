import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';
import 'package:telent_scouting/bloc_skills/skills_cubit.dart';
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

  final List<String> skills = ["P A S S I N G", "D R I B B L I N G", "J U G G L I N G", "E G L T Y"];

  final List<Widget> skillsPages = const [
    PassingScreen(
      skillName: "Passing",
    ),
    DribblingScreen(skillName: "Dribbling"),
    JugglingScreen(skillName: "Juggling",),
    EgltyScreen(skillName: "Eglty",),
  ];
  final List<String> skillsPurpose = const [
    "The purpose of passing is to keep possession of the ball by maneuvering it on the ground between different players with the objective of advancing it up the playing field. Passing brings an advantage in that the team secures possession of the ball, without allowing the opposition an opportunity to attack",
"Dribbling Simply put, this phrase means staying on the ball while moving it around the pitch. Players can use different techniques to achieve this, like hiding and revealing. Dribbling is an important skill to develop",
    "Juggling is a physical skill, performed by a juggler, involving the manipulation of objects for recreation, entertainment, art or sport. The most recognizable form of juggling is toss juggling",
"Agility is an important skill for both attackers and defenders in invasion sports such as codes of football. On the sporting field, agility requires reacting to a stimulus, often presented by an opponent's movement, before a change of direction or speed",
  ];
  final _auth = FirebaseAuth.instance;
  late User siginUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  void getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        siginUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        title: const Text(
          "Football Scouting",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: "Poppins"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              )),
          Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 30,
          ),
        ],
      ),
      drawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.green.shade400,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                },
              ),
              FirebaseAuth.instance.currentUser == null
                  ? ListTile(
                      leading: const Icon(Icons.arrow_back),
                      title: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                    )
                  : ListTile(
                      leading: const Icon(Icons.arrow_back),
                      title: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                      },
                    ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [


                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          pageNum = value;
                        });
                      },
                      itemCount: skills.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(

                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Image.asset("assets/images/mahmoud0 ($index).jpeg",
                                  fit: BoxFit.cover,
                                ),
                              ),
      //F O O T B A L L\nS C O U T
                              Positioned(
                                  left: 22,
                                  top: 40,
                                  child: Text(
                                    "F O O T B A L L\nS C O U T",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 40),
                                  )),
                              // skills name
                              Positioned(
                                left: 22,
                                top: 180,
                                child: Text(skills[index],
                                  style: TextStyle(
                                      color: Colors.green[800],
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    fontFamily: "Kanit"
                                  ),
                                ),
                              ),

                              //butom
                              Positioned(
                                left: 22,
                                bottom: 120,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          alignment: Alignment.bottomCenter,
                                          child: skillsPages[index],
                                          type: PageTransitionType.size,
                                          childCurrent: const Pages(),
                                          duration: const Duration(seconds: 1)),
                                    );

                                  },
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SEE MORE",
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,

                                    child: Text(skillsPurpose[index],
                                      style: TextStyle( fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 18,
                                      fontFamily: "AbrilFatface"
                                      ),
                                      maxLines: 12,
                                      textAlign: TextAlign.left,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    left: 60,
                    right: 60,
                    bottom: 60,
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                              controller: _controller,
                              onDotClicked: (index) => _controller.jumpToPage(index),
                              count: 4,
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                activeDotColor: Colors.green,
                                dotColor: Colors.white,
                                dotHeight: 20,
                                dotWidth: 20,
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
        ],
      ),
    );
  }
}
