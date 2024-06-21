import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
   PageViewItem({super.key, this.image, this.title, this.subtitle});
final String? image;
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200,),
        Container(
          width:MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.3,
            child: Image.asset(image!,
                fit: BoxFit.fill,
            )
        ),
SizedBox(height: 30,),

        Text(title!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
          fontFamily: "Kanit"
        ),
          textAlign: TextAlign.left,
        ),
SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.95,
          child: Text(subtitle!,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color:Colors.grey[500],
                fontSize: 16
            ),
            maxLines: 4,
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
