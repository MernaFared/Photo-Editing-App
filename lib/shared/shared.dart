// ignore_for_file: prefer_const_constructors, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/colors.dart';

//void navigateTo(context, widget) => Navigator.push(
//    context,
//    RouteAnimation(page: widget)
//);
//
//void navigateAndFinish(
//    context,
//    widget,
//    ) =>
//    Navigator.pushAndRemoveUntil(
//      context,
//      RouteAnimation(page: widget),
//          (route) {
//        return false;
//      },
//    );

void navigateTo(context, widget) => Navigator.push(
  context,
  CupertinoPageRoute(

    builder: (context) => widget,

  ),
);

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );

void navigateAndDeleteAll(BuildContext context, Widget page) async {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  page), (Route<dynamic> route) => false);
}


int? userId;
String? token;

String? selectedLanguage;
String UserImage = 'http://codewarenet-001-site10.dtempurl.com/Images/Technician/';
String baseURL = 'http://codewarenet-001-site10.dtempurl.com/api/mobile/';


void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.black87;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget defaultTextButton({
  required Function() function,
  required String text,
  TextStyle? style,
  Color? backgroundColor,
}) =>
    TextButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Text(
        text,
        style: style,
      ),
    );

Widget myCircularIndicator(){
  return Center(
    child: CircularProgressIndicator(
     //color: kMainColor,
    ),
  );
}

