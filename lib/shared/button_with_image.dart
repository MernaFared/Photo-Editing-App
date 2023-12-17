import 'package:flutter/material.dart';

class ButtonWithImage extends StatelessWidget {
  final String text;
  final String image;
  final Color bgcolor;
  final Color textcolor;
  final Color? imagecolor;
  const ButtonWithImage({Key? key, required this.text, required this.image, required this.bgcolor, required this.textcolor, this.imagecolor}) : super(key: key);


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
          Image.asset( image,
            color: imagecolor ,
            height: 25,
            width: 25,
          ),
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
