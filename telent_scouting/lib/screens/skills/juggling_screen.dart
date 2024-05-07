import 'package:flutter/material.dart';
class JugglingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juggling",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Juggling"),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff40BFFF),
                  fixedSize: Size(
                      MediaQuery.of(context).size.width, // width
                      57 // height
                  )),
              child: const Text('Uploed Vedio'),
            ), //
          ],
        ),
      ),
    );
  }
}