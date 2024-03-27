
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/Screens/LoginScreen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("profile"),
        actions: [Container(
      decoration: BoxDecoration(
      color: Colors.grey,
        border: Border.all(color: Colors.black,width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),),
          child: TextButton(
              onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (route) => false);
          },
              child: Text("SinOut")),
        )
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


        SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomLeft: Radius.circular(30)),

              ),
              height: 350,
              width:350 ,
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
