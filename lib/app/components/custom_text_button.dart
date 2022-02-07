import 'package:coffee_shop/app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => kPrimaryColor),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => kPrimaryColor),
          //  padding: MaterialStateProperty.resolveWith(
          //    (states) => EdgeInsets.symmetric(horizontal: 10)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => kPrimaryColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ));
  }
}
