import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
 final void Function()? onPressed;
  const TextBox({super.key, required this.text, required this.sectionName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,style: TextStyle(color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
              fontSize: 18
              ),),
              IconButton(onPressed: onPressed,

                  icon: Icon(Icons.settings))
            ],
          ),
          Text(text),


        ],
      ),
    );
  }
}
