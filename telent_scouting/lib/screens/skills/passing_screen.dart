import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/screens/login_screen.dart';
class PassingScreen extends StatelessWidget {
  const PassingScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Passing",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 30,
              fontFamily:"Poppins"
          ),
        ),
        backgroundColor: Colors.lightGreen,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 25,),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/img_0.png",height: 300,fit: BoxFit.fill,),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser
                ?? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  fixedSize: Size(
                      MediaQuery.of(context).size.width*0.92, // width
                      57 // height
                  ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              ),
              child: const Text(
                'Upload Vedio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily:"Poppins"
                ),
              ),
            ), //
          ],
        ),
      ),
    );
  }
}