import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telent_scouting/Screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/screens/register_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  // final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/img_6.png",
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                ), // App logo
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Talent Scouting',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff223263),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  //controller: emailController,
                  readOnly: false,
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Your Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ), // email
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  // controller: passwordController,
                  readOnly: false,
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    border: OutlineInputBorder(),
                  ),
                ), // password
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff40BFFF),
                      fixedSize: Size(
                          MediaQuery.of(context).size.width, // width
                          57 // height
                          )),
                  child: const Text('Sign in'),
                ), // sign up button
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEBF0FF),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 28, right: 23),
                      child: const Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9098B1),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEBF0FF),
                      ),
                    ),
                  ],
                ), // OR Line
                const SizedBox(
                  height: 8,
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    final userCredential = await signInWithGoogle();
                    if (userCredential.user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Sign in as ${userCredential.user!.displayName}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                        backgroundColor: Colors.lightGreen,
                        duration: const Duration(milliseconds: 1700),
                      ));
                      Future.delayed(
                        const Duration(seconds: 2),
                        () => Navigator.of(context).pop(),
                      );
                    }
                  },
                  icon: Image.asset('assets/images/Google.png'),
                  label: const Text(
                    'Login with google',
                    style: TextStyle(
                      color: Color(0xFF9098B1),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width, // width
                      57, // height
                    ),
                  ),
                ), // login with google
                const SizedBox(
                  height: 4,
                ),

                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have a account?',
                      style: TextStyle(
                        color: Color(0xFF9098B1),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return const RegisterScreen();
                        }));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF40BFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    googleUser?.clearAuthCache();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
