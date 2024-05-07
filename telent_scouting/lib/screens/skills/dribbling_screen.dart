import 'package:flutter/material.dart';
class DribblingScreen extends StatelessWidget {
  const DribblingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dribbling",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Dribbling"),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff40BFFF),
                  fixedSize: Size(
                      MediaQuery.of(context).size.width, // width
                      57 // height
                  )),
              child: const Text('Upload Video'),
            ), //
          ],
        ),
      ),
    );
  }
}