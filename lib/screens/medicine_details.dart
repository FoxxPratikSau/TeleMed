import 'package:flutter/material.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:tele_med/screens/shop_medicine_page.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'cart_page.dart';
import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';

class MedDetailPage extends StatelessWidget {
  final int pageId;
  const MedDetailPage({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<medicine_controller>().medicine_items[pageId];
    Get.find<medicine_controller>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 217, 231),
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
                        Navigator.pop(context);
                      },
                      child: const ReusableIcon(
                          icon: Icons.arrow_back_ios,
                          iconColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 2, 2, 119))),
                  //ReusableIcon(icon: Icons.shopping_cart_outlined),
                  GetBuilder<medicine_controller>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(CartPage());
                        },
                        child: Stack(
                          children: [
                            const ReusableIcon(
                                iconColor: Colors.white,
                                backgroundColor: Color.fromARGB(255, 2, 2, 119),
                                icon: Icons.shopping_cart_outlined),
                            controller.totalItems >= 1
                                // ignore: prefer_const_constructors
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    // ignore: prefer_const_constructors
                                    child: ReusableIcon(
                                      icon: Icons.circle,
                                      size: 25,
                                      iconColor: Colors.transparent,
                                      backgroundColor:
                                          const Color.fromARGB(255, 255, 17, 0),
                                    ),
                                  )
                                : Container(),
                            Get.find<medicine_controller>().totalItems >= 1
                                ? Positioned(
                                    right: 8,
                                    top: 4.5,
                                    child: SmallFont(
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
                    },
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    // color: const Color.fromARGB(255, 2, 2, 119),
                    gradient: LinearGradient(
                      colors: [
                        kPrimaryColor,
                        const Color(0xFF000030),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    //border: Border.all(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensions.size15),
                      topRight: Radius.circular(dimensions.size15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: BigFont(
                      textAlign: TextAlign.left,
                      text: product.name!,
                      size: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: kPrimaryColor,
              expandedHeight: dimensions.size260,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: dimensions.size10,
                    ),
                    child: SmallFont(
                        text: product.desc!,
                        size: dimensions.size15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: BigFont(
                      text: '₹ ${product.price.toString()}',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      size: 40.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<medicine_controller>(builder: (medicine) {
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
                            child:
                                const Icon(Icons.remove, color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: BigFont(
                            text: medicine.inCartItems.toString(),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            medicine.setQuantity(true);
                          },
                          child: const Icon(Icons.add, color: Colors.grey),
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
                          color: kPrimaryColor,
                          gradient: LinearGradient(
                            colors: [
                              kPrimaryColor,
                              const Color(0xFF000030),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: BigFont(
                        text: 'Add to Cart',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
