import 'package:cart_cubit/screen/HomeSceen.dart';
import 'package:flutter/material.dart';
class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
    } );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EEFA),
      body: Center(
        child: Text("Cart",
            style: TextStyle(fontSize: 50,color:Color(0xFF2D5BD0) )
        ),
      ),
    );
  }
}
