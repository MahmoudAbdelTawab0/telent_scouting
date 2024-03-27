import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/HomeScreen.dart';
import 'package:telent_scouting/Screens/Profile.dart';
class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int selectedPage = 1;
  List<Widget> pages = [

    Text("data2"),
    HomeScreen(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.note),label: "Trials"),
          BottomNavigationBarItem(icon:Icon(Icons.directions),label: "Drills"),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: "profil"),
        ],
      ),
      body: pages[selectedPage],






    );;
  }
}
