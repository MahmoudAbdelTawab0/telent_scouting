import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget card_Rated({
  required String image,
  required String name,
  required double price,
  required int discount,
  required int rating,
}) {
  return Row(
    children: [
      Container(
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffEBF0FF),
            strokeAlign: 2,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 109,
              width: 109,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Shimmer.fromColors(
                    child: Container(
                      height: 109,
                      width: 109,
                      color: Colors.grey,
                    ),
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade400
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            //name//
            Text(
              name,
              style: TextStyle(
                  color: Color(0xff223263),
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 4),
            //rating star//
            Container(
              height: 16,
              //rating star//
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //light star//
                  SizedBox(
                    width: rating * 15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: rating,
                      itemBuilder: (BuildContext context, int index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        );
                      },
                    ),
                  ),
                  //off star//
                  SizedBox(
                    width: (5 - rating) * 15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5 - rating,
                      itemBuilder: (BuildContext context, int index) {
                        return Icon(
                          Icons.star,
                          color: Color(0xffEBF0FF),
                          size: 15,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            //new Price//
            Text(
              "\$${(price - (price * discount / 100)).toInt()}",
              style: TextStyle(
                  color: Color(0xff40BFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            // price .... discount % off//
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discount > 0 ? '\$$price' : '',
                  style: TextStyle(
                    color: Color(0xff9098B1),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 4,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  discount > 0
                      ? '$discount% Off'
                      : '',
                  style: TextStyle(
                    color: Color(0xffFB7181),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}