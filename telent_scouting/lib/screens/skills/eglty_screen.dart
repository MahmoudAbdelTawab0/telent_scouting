import 'package:flutter/material.dart';

class EgltyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eglty",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Eglty"),
            const SizedBox(
              height: 20,
            ),
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
