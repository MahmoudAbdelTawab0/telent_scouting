import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String fullname;
  late String height;
  late String weight;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(15),
                     child: Image.asset("assets/images/img_6.png",
                       height: 70,
                       width: 70,
                       fit: BoxFit.fill,),
                 ),// App logo
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
                  'Sign up to continue',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // User Name //
                TextFormField(
                  onChanged: (val){
                    fullname = val;
                  },
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ), // email
                const SizedBox(
                  height: 8,
                ),
                // User Height //
                TextFormField(
                  onChanged: (val){
                    height = val;
                  },
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: 'Your Height',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                ), // email
                const SizedBox(
                  height: 8,
                ),
                // User Height //
                TextFormField(
                  onChanged: (val){
                    weight = val;
                  },
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: 'Your Weight',
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
                    border: OutlineInputBorder(),
                  ),
                ), // email
                const SizedBox(
                  height: 8,
                ),
                // Email //
                TextFormField(
                  onChanged: (val){
                    email = val;
                  },
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
                // Password //
                TextFormField(
                  onChanged: (val){
                    password = val;
                  },
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
                // Password Again //
                TextFormField(
                  onChanged: (val){
                    password = val;
                  },
                  readOnly: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password Again',
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
                  child: const Text('Sign Up'),
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
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do you have a account?',
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
                              return Login();
                            }));
                      },
                      child: const Text(
                        ' Login',
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
      ),
    );
  }
}
