import 'package:flutter/material.dart';


class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade300,
      ),
    );
  }
}



