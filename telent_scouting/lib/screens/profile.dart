
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundImage:NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL
                        ?? "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png",
                ),
            ),
            const SizedBox(height: 5,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomLeft: Radius.circular(30)),

              ),
              height: MediaQuery.of(context).size.height*0.5,
              width:MediaQuery.of(context).size.width*0.9,
              margin: const EdgeInsets.only(left: 10,top: 20),
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName ?? "Anonymous User",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: "poppins",
                      color: Colors.white
                    ),
                  ),

                  Text(
                    "Email: \n  ${FirebaseAuth.instance.currentUser?.email}" ?? "Email: ...",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        fontSize: 18,
                      fontFamily: "Poppins",
                      color: Colors.white
                    ),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.phoneNumber?? "Phone Number: ...",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        fontSize: 18,
                      fontFamily: "Poppins",
                      color: Colors.white
                    ),)

                ],
              ),
            )

              ],
            ),
      )


      
    );
  }
}
