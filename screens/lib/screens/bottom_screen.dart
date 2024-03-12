import 'package:flutter/material.dart';
import 'package:screens/screens/home_screen.dart';
import 'package:screens/screens/login_screen.dart';
import 'package:screens/screens/register_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens =[
    const Home(),
    const Login(),
    const Register(),
    const Register(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label:'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label:'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label:'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:'Account',
          ),

        ],),
      body: screens[currentIndex],
    );
  }
}
