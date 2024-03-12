import 'package:flutter/material.dart';

Widget circleAvatar({required String imageNet, required String name}) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    child: Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Color(0xFFEBF0FF),
          child: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: Image.network(imageNet, height: 35, fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xff9098B1),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}