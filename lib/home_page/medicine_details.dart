import 'package:flutter/material.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/home_page/E-commerce_medicine.dart';
import 'package:tele_med/home_page/cart_page.dart';
import 'package:tele_med/widgets/dimensions.dart';

import 'package:get/get.dart';

import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';

class medicine_details extends StatelessWidget {
  final int pageId;
  const medicine_details({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<medicine_controller>().medicine_items[pageId];
    Get.find<medicine_controller>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(e_commerce_medicine());
                        },
                        child: reusable_icons(icon: Icons.arrow_back_ios)),
                    GetBuilder<medicine_controller>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(CartPage());
                        },
                        child: Stack(
                          children: [
                            reusable_icons(icon: Icons.shopping_cart_outlined),
                            controller.totalItems >= 1
                                // ignore: prefer_const_constructors
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    // ignore: prefer_const_constructors
                                    child: reusable_icons(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor:
                                          Color.fromARGB(255, 34, 18, 156),
                                    ),
                                  )
                                : Container(),
                            Get.find<medicine_controller>().totalItems >= 1
                                ? Positioned(
                                    right: 4,
                                    top: 4,
                                    child: big_font(
                                      text: Get.find<medicine_controller>()
                                          .totalItems
                                          .toString(),
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      );
                    })
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Container(
                    child: Center(
                      child: big_font(
                        text: product.name!,
                        size: 23,
                      ),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dimensions.size20),
                        topRight: Radius.circular(dimensions.size20),
                      ),
                    ),
                  ),
                ),
                pinned: true,
                backgroundColor: Color.fromARGB(255, 113, 133, 229),
                expandedHeight: 230,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    product.image!,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        product.desc!,
                        style: TextStyle(
                            fontSize: dimensions.size15,
                            fontWeight: FontWeight.w500),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: dimensions.size10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            GetBuilder<medicine_controller>(builder: (medicine) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: dimensions.size100,
                padding: EdgeInsets.symmetric(
                  vertical: dimensions.size10,
                  horizontal: dimensions.size20,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensions.size20 * 2),
                      topRight: Radius.circular(dimensions.size20 * 2),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(dimensions.size20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(dimensions.size20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                medicine.setQuantity(false);
                              },
                              child: Icon(Icons.remove, color: Colors.grey)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: big_font(
                              text: medicine.inCartItems.toString(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              medicine.setQuantity(true);
                            },
                            child: Icon(Icons.add, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        medicine.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.all(dimensions.size20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensions.size20),
                          color: Color.fromARGB(255, 34, 18, 156),
                        ),
                        child: big_font(
                          text:
                              '₹' + product.price.toString() + '| Add to Cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
