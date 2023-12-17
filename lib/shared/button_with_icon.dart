import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final Widget widget ;
  final Color bgcolor;
  final Color textcolor;
  const ButtonWithIcon({Key? key, required this.text, required this.widget, required this.bgcolor, required this.textcolor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(height: 60,
      width: double.infinity,
      decoration:
      BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          SizedBox(width: 10,),
          Text(text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textcolor,
            ),)
        ],

      ),
    );
  }
}
