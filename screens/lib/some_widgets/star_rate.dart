import 'package:flutter/material.dart';

starRate({required int rating, required int size}){
  return Container(
    height: 16,
    //rating star//
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //light star//
        SizedBox(
          width: (rating * size).toDouble(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: rating,
            itemBuilder: (BuildContext context, int index) {
              return Icon(
                Icons.star,
                color: Colors.amber,
                size: size.toDouble(),
              );
            },
          ),
        ),
        //off star//
        SizedBox(
          width: ((5 - rating) * size).toDouble(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5 - rating,
            itemBuilder: (BuildContext context, int index) {
              return Icon(
                Icons.star,
                color: Color(0xffEBF0FF),
                size: size.toDouble(),
              );
            },
          ),
        ),
      ],
    ),
  );
}