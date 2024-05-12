import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 30,
          width: 30,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white)),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen,
        title: const Text(
          "About US",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: const Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Team Member: ",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
            Text(
              "Ahmed Mohamed Omar ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Poppins",
                  color: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}
