
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telent_scouting/Screens/LoginScreen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
          ),
        title: Text("My Account"),
        actions: [
           TextButton(
              onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (route) => false);
          },
              child: Text("SinOut")),

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundImage:NetworkImage(FirebaseAuth.instance.currentUser?.photoURL?? "")),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomLeft: Radius.circular(30)),

              ),
              height: MediaQuery.of(context).size.height*0.5,
              width:MediaQuery.of(context).size.width*0.9,
              margin: EdgeInsets.only(left: 10,top: 20),
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(FirebaseAuth.instance.currentUser?.displayName ?? "",
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                  Text(FirebaseAuth.instance.currentUser?.email ?? "",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  Text(FirebaseAuth.instance.currentUser?.phoneNumber ?? "No Number",
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  Text(FirebaseAuth.instance.currentUser?.uid?? "",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  )

                ],
              ),
            )

              ],
            ),
      )


      
    );
  }
}
