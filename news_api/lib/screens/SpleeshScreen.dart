import 'package:flutter/material.dart';
import 'package:news_api/screens/HomeScreen.dart';
class SpleeshScreen extends StatefulWidget {
  const SpleeshScreen({super.key});

  @override
  State<SpleeshScreen> createState() => _SpleeshScreenState();
}

class _SpleeshScreenState extends State<SpleeshScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
    } );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EEFA),
      body: Center(
        child: Text("News",
        style: TextStyle(fontSize: 50,color:Color(0xFF2D5BD0) )
        ),
      ),
    );
  }
}
