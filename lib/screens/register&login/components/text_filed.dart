import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  const MyTextField({Key? key, required this.controller, required this.hintText, required this.obscureText, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextField(
       controller: controller,
       obscureText: obscureText,
       decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey.shade400),
        ),
        fillColor: kGray200Color,
        filled: true,
        suffixIcon: suffixIcon,
        hintText:hintText,
        hintStyle: TextStyle(color:Colors.grey.shade500),
      ),
    );
  }
}
