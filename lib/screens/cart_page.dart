import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/screens/no_items_page.dart';
import 'package:tele_med/widgets/small_font.dart';
import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';
import 'package:tele_med/widgets/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 217, 231),
      body: Stack(
        children: [
          Positioned(
            left: dimensions.size20,
            right: dimensions.size20,
            top: dimensions.size45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const ReusableIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 34, 18, 156),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const ReusableIcon(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 34, 18, 156),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getItems.isNotEmpty
                ? Positioned(
                    top: dimensions.size30 * 3.5,
                    left: dimensions.size20,
                    right: dimensions.size20,
                    bottom: 0,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: cartController.getItems.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 235, 238, 167),
                                      borderRadius: BorderRadius.circular(
                                          dimensions.size20)),
                                  margin: EdgeInsets.all(dimensions.size10),
                                  height: dimensions.size20 * 5,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        // onTap: () {
                                        //   var popularIndex = Get.find<
                                        //           medicine_controller>()
                                        //       .medicine_items
                                        //       .indexOf(
                                        //           cartList[index].product!);
                                        //   if (popularIndex >= 0) {
                                        //     Get.toNamed(
                                        //       RouteHelper.getPopularFood(
                                        //           popularIndex, 'cartpage'),
                                        //     );
                                        //   } else {
                                        //     var recommendedIndex = Get.find<
                                        //             RecommendedProductController>()
                                        //         .recommendedProductList
                                        //         .indexOf(cartList[index]
                                        //             .product!);
                                        //     if (recommendedIndex < 0) {
                                        //       Get.snackbar('History product',
                                        //           'Product review is not available.');
                                        //     } else {
                                        //       Get.toNamed(
                                        //         RouteHelper
                                        //             .getRecommendedFood(
                                        //                 recommendedIndex),
                                        //       );
                                        //     }
                                        //   }
                                        // },
                                        child: Container(
                                          width: dimensions.size20 * 5,
                                          height: dimensions.size20 * 5,
                                          margin: EdgeInsets.only(
                                            right: dimensions.size10,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                cartController
                                                    .getItems[index].image!,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              dimensions.size20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        height: dimensions.size20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigFont(
                                              text: cartController
                                                  .getItems[index].name!,
                                              color: Colors.black54,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigFont(
                                                  text:
                                                      "₹ ${cartController.getItems[index].price.toString()}",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(
                                                    dimensions.size10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      dimensions.size20,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.grey
                                                              .withOpacity(0.4),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5.0,
                                                        ),
                                                        child: BigFont(
                                                          text: cartList[index]
                                                              .quantity
                                                              .toString(),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.grey
                                                              .withOpacity(0.4),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              });
                        })),
                  )
                : const NoItemsPage(
                    text: 'Your cart is empty..Plese add some items!',
                  );
          }),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
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
            child: cartController.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(dimensions.size20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensions.size20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: BigFont(
                                text:
                                    '₹ ${cartController.totalAmount.toString()}',
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        //onTap: () => cartController.addtohistory(),
                        child: Container(
                          padding: EdgeInsets.all(dimensions.size20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimensions.size20),
                              gradient: LinearGradient(
                                colors: [
                                  kPrimaryColor,
                                  const Color(0xFF000030),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                              //color: const Color.fromARGB(255, 34, 18, 156),
                              ),
                          child: BigFont(
                            text: 'CheckOut',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container());
      }),
    );
  }
}
