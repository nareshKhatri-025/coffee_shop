import 'package:coffee_shop/app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateColor.resolveWith((states) => kPrimaryColor),
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            padding: MaterialStateProperty.resolveWith((states) =>
                EdgeInsets.symmetric(
                    horizontal: Get.size.width / 8,
                    vertical: Get.size.width / 20)),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.white60)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: kPrimaryButtonColor, fontSize: 24),
        ));
  }
}
