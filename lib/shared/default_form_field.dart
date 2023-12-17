
// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final double? width;
  final String? hintText;
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validatorFun;
  final int? maxLines;
  final TextInputType? textInputType;
  final bool? isSecure;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? focusColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final String? initialValue;
  final double? borderRadius;


  const CustomTextFormField(
      {Key? key,
        this.controller,
        this.textInputType,
        this.maxLines,
        this.width,
        this.hintText="",
        this.labelText,
        this.onChanged,
        this.validatorFun,
        this.isSecure=false,
        this.backgroundColor = Colors.white,
        this.textColor = Colors.black,
        //this.borderColor = kGrayColor,
        this.focusColor,
        this.prefixIcon,
        this.suffixIcon,
        this.border,
        this.initialValue,
        this.borderRadius = 5, this.borderColor
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 6),
      //width: width ?? ScreenUtil().screenWidth * 0.9,
//      decoration: BoxDecoration(
//          color: backgroundColor,
//          borderRadius: BorderRadius.circular(borderRadius),
//          border: Border.all(color: borderColor)
//      ),
      child: TextFormField(
        controller: controller,
        validator: validatorFun,
        obscureText: isSecure ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        style: theme.textTheme.bodyText1?.copyWith(
          color: textColor,

        ),
        //cursorColor: kMainColor,
        textAlign: TextAlign.start,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        initialValue: initialValue ?? null,
        decoration: InputDecoration(
          focusColor: focusColor,
          fillColor: backgroundColor,
          prefixIcon: prefixIcon ?? null,
          suffixIcon: suffixIcon ?? null,
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(
              color: Colors.grey
          ),
          hintStyle: const TextStyle(
              color: Colors.grey
          ),
          border: border ?? null,
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderColor ?? kGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderColor ?? kGrayColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderColor ?? kGrayColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide(color: borderColor ?? kGrayColor),
          ),
          //border: InputBorder.none,
        ),
      ),
    );
  }
}
