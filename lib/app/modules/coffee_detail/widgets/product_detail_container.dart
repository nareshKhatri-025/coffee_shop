
import 'package:coffee_shop/app/components/custom_text_button.dart';
import 'package:coffee_shop/app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailContainer extends StatelessWidget {
  const ProductDetailContainer({
    Key? key,
    required this.name,
    required this.selectedPrice,
    required this.desc,
    required this.rating,
    required this.ratingCount,
  }) : super(key: key);
  final String name;
  final double selectedPrice;
  final int ratingCount;
  final double rating;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width / 20),
      child: Container(
        padding: EdgeInsets.only(
            top: Get.size.width / 20,
            right: Get.size.width / 15,
            left: Get.size.width / 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$  " + selectedPrice.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: Get.size.width / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.size.width / 3,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Text(
                        desc,
                        style: TextStyle(color: kLightTextColor, fontSize: 18),
                      ),
                      Text(
                        "⭐" +
                            " " +
                            rating.toString() +
                            " (" +
                            ratingCount.toString() +
                            ")",
                        style: TextStyle(color: kLightTextColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                CustomTextButton(
                  text: "Add to cart",
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: kPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
        height: Get.size.width / 3,
      ),
    );
  }
}
