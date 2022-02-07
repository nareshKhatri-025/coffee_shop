import 'package:coffee_shop/app/modules/coffee_detail/coffer_detail.dart';
import 'package:coffee_shop/app/modules/home/widgets/list_view_child.dart';
import 'package:coffee_shop/app/theme/color.dart';
import 'package:coffee_shop/app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text("JumpstartCoffee"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: size.width / 30,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                  child: Container(
                    width: size.width,
                    height: size.width / 8,
                    decoration: BoxDecoration(
                        color: const Color(0xff50525F),
                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: size.width / 30,
                          top: size.width / 65,
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        TextField(
                          cursorColor: kPrimaryColor,
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width / 8),
                            enabledBorder: kSearchIutlineInputBorder,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 5,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(5, (index) => ListViewChild()),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                _getHeading(context, "Available Promo"),
                SizedBox(
                  height: size.height / 50,
                ),
                Center(
                    child: Image.asset(
                  "assets/banner.png",
                  width: size.width,
                  fit: BoxFit.cover,
                )),
                SizedBox(
                  height: size.height / 40,
                ),
                _getHeading(context, "Your Recommendation"),
                SizedBox(
                  height: size.height / 50,
                ),
                SizedBox(
                  height: size.height / 4,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: kDemoCoffeList.map((element) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: size.width / 30, left: size.width / 30),
                        child: Container(
                          width: size.width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              )),
                          child: GestureDetector(
                            onTap: () =>
                                Get.to(() => CoffeDetail(coffee: element)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Hero(
                                        tag: element.id.toString(),
                                        child: Center(
                                          child: Image.asset(
                                            element.image,
                                            width: 78,
                                            height: 90,
                                            fit: BoxFit.cover,
                                          ),
                                        ))),
                                Expanded(
                                    child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width / 30,
                                      vertical: size.width / 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.name.toString(),
                                      ),
                                      Row(
                                        children: [
                                          Text("\$ " + "${element.prices[0]}")
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Padding _getHeading(BuildContext context, String data) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: Text(
        data,
        style: kH1TextStyle,
      ),
    );
  }
}
