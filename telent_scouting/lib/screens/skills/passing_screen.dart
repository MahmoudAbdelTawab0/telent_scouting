import 'package:flutter/material.dart';
class PassingScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passing",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/img_0.png",height: 300,fit: BoxFit.fill,),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff40BFFF),
                  fixedSize: Size(
                      MediaQuery.of(context).size.width, // width
                      57 // height
                  )),
              child: const Text('Upload Vedio'),
            ), //
          ],
        ),
      ),
    );
  }
}