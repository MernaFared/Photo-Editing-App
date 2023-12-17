// // ignore_for_file: prefer_typing_uninitialized_variables, avoid_web_libraries_in_flutter, implementation_imports
//
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
//
// class RouteAnimation extends PageRouteBuilder {
//   final page;
//   RouteAnimation({this.page}) : super(
//       pageBuilder: (context, animation,secondAnimation) => page,
//       transitionsBuilder: (context, animation,secondAnimation,child){
//         var begin = context.locale.languageCode == 'ar' ? const Offset(1, 0) : const Offset(-1, 0);   /// right to left animation (1,0) :: left to right animation (-1,0)
//         var end = const Offset(0, 0);
//         var tween = Tween(begin: begin,end: end);
//         //var offsetAnimation = animation.drive(tween);
//         var curveAnimation = CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeInOut
//         );
//         return SlideTransition(
//           position: tween.animate(curveAnimation),
//           child: child,
//         );
//       }
//   );
// }