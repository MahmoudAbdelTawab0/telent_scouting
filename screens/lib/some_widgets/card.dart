import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget card({
  required String image,
  required String name,
  required double price,
  required int discount,
}) {
  return Row(
    children: [
      Container(
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffEBF0FF),
            strokeAlign: 2,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 105,
              width: 109,
              fit: BoxFit.contain,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
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
      SizedBox(
        width: 16,
      ),
    ],
  );
}