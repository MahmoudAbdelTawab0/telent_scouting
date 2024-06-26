import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/screens/home_screen.dart';
import 'package:telent_scouting/screens/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
       stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
         if(snapshot.hasData){
           return HomeScreen();
         }else{
           return LoginScreen();
         }
        },
      ),

    );
  }
}
