import 'package:coffee_shop/app/theme/color.dart';
import 'package:coffee_shop/app/theme/style.dart';
import 'package:flutter/material.dart';

class ListViewChild extends StatelessWidget {
  const ListViewChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 6, left: 12),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: size.width / 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/cup_white.png"),
              Text(
                "Coffee",
                style: kH1TextStyle,
              ),
              Text(
                "67 Menus",
                style: TextStyle(color: Color(0xff707070)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
