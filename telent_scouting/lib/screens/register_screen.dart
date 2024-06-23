import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/pages.dart';
import 'package:telent_scouting/screens/auth_screen.dart';
import 'package:telent_scouting/screens/home_screen.dart';
import 'package:telent_scouting/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final CollectionReference myItem = FirebaseFirestore.instance.collection("Users");
  final fullnameController = TextEditingController();
final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  Future signUserup () async {
    showDialog(context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Your email has been ceareted",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins"),
        ),
        backgroundColor: Colors.green.shade400,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
          () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );

    try{
      final userCredential = await FirebaseAuth.instance;
      userCredential.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);

    }on FirebaseAuthException catch(e){
     print(e);

    }
    try{
      await myItem.add({
        "username": fullnameController.text,
        "phonenumber": phoneController.text,
        "email": emailController.text,
        "address":addressController,
      });
    }catch(e){
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(

        children: [
          Container(
            child: Column(
                children: [
                  SizedBox(height: 100,),
                  Text("Sing Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Kanit",
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 4),
                    child: TextFormField(
                      controller: fullnameController,
                      readOnly: false,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 4),
                    child: TextFormField(
                      controller: phoneController,
                      readOnly: false,
                      decoration: const InputDecoration(
                        hintText: 'Phonenumber',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 4),
                    child: TextFormField(
                      controller: addressController,
                      readOnly: false,
                      decoration: const InputDecoration(
                        hintText: 'Address',
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 4),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      readOnly: false,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.check),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 4),
                    child: TextFormField(
                     controller: passwordController,
obscureText: true,
                      readOnly: false,
                      decoration:  InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(onPressed: (){}, icon:Icon(Icons.visibility_off,)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: signUserup,
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33),
                          color:Colors.green.shade400
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100)),
                color: Colors.green.shade400
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sing Up,to create a account",
                    style: TextStyle(color: Colors.black54,
                        fontSize: 20,
                        fontFamily: "AbrilFatface",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("S I N G I N",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 8,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.green.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
