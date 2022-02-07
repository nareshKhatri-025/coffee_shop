import 'dart:ffi';

import 'package:coffee_shop/app/components/custom_elevated_button.dart';
import 'package:coffee_shop/app/components/custom_text_button.dart';
import 'package:coffee_shop/app/models/coffee.dart';
import 'package:coffee_shop/app/modules/coffee_detail/controller/coffe_detail_controller.dart';
import 'package:coffee_shop/app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_quantity_button.dart';
import 'widgets/product_detail_container.dart';

class CoffeDetail extends StatefulWidget {
  const CoffeDetail({Key? key, required this.coffee}) : super(key: key);
  final Coffee coffee;

  @override
  State<CoffeDetail> createState() => _CoffeDetailState();
}

class _CoffeDetailState extends State<CoffeDetail> {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut(() => CoffeDetailController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: Get.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const BackButton(
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: Get.size.width / 10),
                    child: const Text(
                      "Item Detail",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            SizedBox(
              height: Get.size.width / 30,
            ),
            GetBuilder<CoffeDetailController>(
              builder: (controller) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: widget.coffee.id.toString(),
                        child: Center(
                          child: Image.asset(
                            widget.coffee.image,
                            width: Get.size.width / 2,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.size.width / 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomQuantityButton(
                            icon: Icons.remove_sharp,
                            onTap: () {
                              controller.onDecreament();
                            },
                          ),
                          SizedBox(
                            height: Get.size.width / 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Obx(() => Text(
                                  controller.quatity.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                          SizedBox(
                            height: Get.size.width / 40,
                          ),
                          CustomQuantityButton(
                            icon: Icons.add,
                            onTap: () => controller.onIncreament(),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: Get.size.width / 20,
            ),
            ProductDetailContainer(
              name: widget.coffee.name.toString(),
              selectedPrice: 45,
              desc: "Its a coffee",
              rating: 4.5,
              ratingCount: 6500,
            ),
            SizedBox(
              height: Get.size.width / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.size.width / 30),
              child: GetBuilder<CoffeDetailController>(
                init: CoffeDetailController(),
                initState: (_) {},
                builder: (con) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      con.selectedOption.value == 1
                          ? _getActiveOption(120, widget.coffee.prices[0], 1)
                          : _getInActiveOption(120, widget.coffee.prices[0], 1),
                      con.selectedOption.value == 2
                          ? _getActiveOption(250, widget.coffee.prices[1], 2)
                          : _getInActiveOption(250, widget.coffee.prices[1], 2),
                      con.selectedOption.value == 3
                          ? _getActiveOption(400, widget.coffee.prices[2], 3)
                          : _getInActiveOption(400, widget.coffee.prices[2], 3),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: Get.size.width / 20,
            ),
            CustomElevatedButton(text: "Add to cart", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _getInActiveOption(int ml, double price, int option) {
    return GetBuilder<CoffeDetailController>(builder: (con) {
      return GestureDetector(
        onTap: () => con.changeOption(option),
        child: Container(
          width: Get.size.width / 4,
          height: Get.size.width / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kPrimaryLightColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ml.toString() + " ml",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: Get.size.width / 30,
              ),
              Text("\$ " + price.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
      );
    });
  }

  Widget _getActiveOption(int ml, double price, int option) {
    return GetBuilder<CoffeDetailController>(builder: (con) {
      return GestureDetector(
        onTap: () => con.changeOption(option),
        child: Container(
          width: Get.size.width / 4,
          height: Get.size.width / 4,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: kPrimaryLightColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ml.toString() + " ml",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: Get.size.width / 30,
              ),
              Text("\$ " + price.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
      );
    });
  }
}
