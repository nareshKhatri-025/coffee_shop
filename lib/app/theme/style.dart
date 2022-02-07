import 'package:coffee_shop/app/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kH1TextStyle = GoogleFonts.poppins(
  fontSize: 24,
  color: Colors.white,
);

const kSearchIutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const kDemoCoffeList = [
  Coffee(
      id: 1,
      name: "Piccola Latte",
      prices: [40, 68, 90],
      image: "assets/coffe_cup.png"),
  Coffee(
      id: 2,
      name: "Macchiato",
      prices: [40, 68, 90],
      image: "assets/open-cup.png"),
  Coffee(
      id: 3,
      name: "Caffe Breve",
      prices: [40, 68, 90],
      image: "assets/cup.png"),
];
