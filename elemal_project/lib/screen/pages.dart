
import 'package:elemal_project/cubits/bady_cubit.dart';
import 'package:elemal_project/screen/category_screen.dart';
import 'package:elemal_project/screen/home_screen.dart';
import 'package:elemal_project/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int selectedPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const Text("data"),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
backgroundColor: Color(0xFF336EA6),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPage,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Image.asset("asstes/images/Group (1).png"),label: "Home"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/home-category 1.png"),label: "Category"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/watch.png"),label: "Book"),
          BottomNavigationBarItem(icon:Image.asset("asstes/images/fi-rr-user.png"),label: "profil"),
        ],
      ),
      body: pages[selectedPage]





    );
  }
}
