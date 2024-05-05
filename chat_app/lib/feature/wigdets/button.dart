import 'package:chat_app/core/app_color.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Button({required this.color,required this.title,required this.onPressed});
  final Color color;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () => onPressed,
          height: 42,
          minWidth: MediaQuery.of(context).size.width,
          child: Text(title,
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
