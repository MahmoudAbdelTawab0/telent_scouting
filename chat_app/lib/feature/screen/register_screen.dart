import 'package:chat_app/core/app_color.dart';
import 'package:chat_app/feature/wigdets/button.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              child: Image.asset("assets/images/chat_imge.jpg"),
            ),
            SizedBox(height: 50,),
            TextField(
              onChanged: (value){},
              decoration: InputDecoration(
                hintText: 'Entre Your Email',
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color: Colors.black,
                    width: 1,
                  ) ,

                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ) ,

                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value){},
              decoration: InputDecoration(
                hintText: 'Entre Password',
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color: Colors.black,
                    width: 1,
                  ) ,

                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ) ,

                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Button(color: Colors.blue[800]!,
              title: "Register",
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
