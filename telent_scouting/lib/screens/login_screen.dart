import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:telent_scouting/Screens/pages.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),

            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/img_5.png"),
                    ),
                  ],
                ), // App logo
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Telent Scouting',
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
                  readOnly: false,
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
                  readOnly: false,
                  obscureText: true,
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const Pages();
                        }));
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
                  onPressed: () async{
                   final userCredential = await signInWithGoogle();
                  if(userCredential.user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder:(context) => const Pages()));
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
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook_outlined),
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
                        57 // height
                    ),
                  ),
                ), // login with facebook
                const SizedBox(
                  height: 4,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Color(0xFF40BFFF),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
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
                              return HomeScreen();
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
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    googleUser?.clearAuthCache();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}