import 'package:flutter/material.dart';
import 'package:telent_scouting/screens/home_screen.dart';
import 'package:telent_scouting/screens/profile.dart';
class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int selectedPage = 1;
  List<Widget> pages = [

    const Text("data2"),
    HomeScreen(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedPage,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.lightGreen,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        selectedIconTheme: const IconThemeData(size: 32),
        iconSize: 20,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.note,),label: "Trials"),
          BottomNavigationBarItem(icon:Icon(Icons.directions,),label: "Drills"),
          BottomNavigationBarItem(icon:Icon(Icons.person,),label: "profile"),
        ],
      ),
      body: pages[selectedPage],

    );
  }
}
