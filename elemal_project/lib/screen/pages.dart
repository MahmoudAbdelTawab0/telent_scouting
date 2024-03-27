
import 'package:elemal_project/screen/category_screen.dart';
import 'package:elemal_project/screen/home_screen.dart';
import 'package:elemal_project/screen/profile.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int selectedPage = 1;
  List<Widget> pages = [


    HomeScreen(),
    CategoryScreen(),
    Text("data"),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF233B55),

        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFBDCAD6),
        items: [
          BottomNavigationBarItem(icon: Image.asset("asstes/images/Group (1).png"),label: "Home"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/home-category 1.png"),label: "Category"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/watch.png"),label: "Book"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/fi-rr-user.png"),label: "profil"),
        ],
      ),
      body: pages[selectedPage],






    );
  }
}
