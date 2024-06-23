import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telent_scouting/Screens/home_screen.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/Screens/skills/eglty_screen.dart';
import 'package:telent_scouting/Screens/skills/juggling_screen.dart';
import 'package:telent_scouting/Screens/skills/passing_screen.dart';
import 'package:telent_scouting/Screens/splash_screen.dart';
import 'package:telent_scouting/bloc_skills/skills_cubit.dart';
import 'package:telent_scouting/screens/login_screen.dart';
import 'package:telent_scouting/screens/on_boarding.dart';
import 'package:telent_scouting/screens/profile.dart';
import 'package:telent_scouting/screens/register_screen.dart';
import 'package:telent_scouting/screens/result_screen.dart';
import 'package:telent_scouting/screens/skills/dribbling_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SkillsCubit(),
        child:ResultScreen()
        //HomeScreen()
       // Profile()
        //LoginScreen()
       // OnBoarding()
        //DribblingScreen(skillName: 'Dribbling',)
        // JugglingScreen(skillName: "Juggling",)
        //EgltyScreen(skillName: 'Eglty',SplashScreen()
        //RegisterScreen()
        //Pages()
         //const LoginScreen()
        // PassingScreen(skillName: 'Passing',),
      ),

    );
  }
}