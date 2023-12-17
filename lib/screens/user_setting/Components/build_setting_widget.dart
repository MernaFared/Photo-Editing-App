import 'package:flutter/material.dart';

class BuildSettingWidget extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final TextStyle? style;
  final bool? showicon;
  const BuildSettingWidget({Key? key, this.bgColor, required this.title, this.showicon, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Text(
            title,
            style: style ?? const TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
          ),
          const Expanded(child: SizedBox()),
         if(showicon == true )
            const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,)
        ],
      ),
    );
  }
}
