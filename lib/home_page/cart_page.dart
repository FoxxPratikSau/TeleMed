import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/home_page/E-commerce_medicine.dart';
import 'package:tele_med/home_page/no_items_page.dart';
import 'package:tele_med/widgets/small_font.dart';
import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';
import 'package:tele_med/widgets/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 217, 231),
      body: Stack(
        children: [
          Positioned(
              left: dimensions.size20,
              right: dimensions.size20,
              top: dimensions.size45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusable_icons(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 34, 18, 156),
                  ),
                  SizedBox(width: dimensions.size20 * 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(e_commerce_medicine());
                    },
                    child: reusable_icons(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 34, 18, 156),
                    ),
                  ),
                  reusable_icons(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 34, 18, 156),
                  ),
                ],
              )),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: dimensions.size20 * 4.5,
                    left: dimensions.size20,
                    right: dimensions.size20,
                    bottom: 0,
                    child: Container(
                      //color: Colors.red,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                              builder: (cartController) {
                            var _cartList = cartController.getItems;
                            return ListView.builder(
                                itemCount: cartController.getItems.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 238, 167),
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
                                          //           _cartList[index].product!);
                                          //   if (popularIndex >= 0) {
                                          //     Get.toNamed(
                                          //       RouteHelper.getPopularFood(
                                          //           popularIndex, 'cartpage'),
                                          //     );
                                          //   } else {
                                          //     var recommendedIndex = Get.find<
                                          //             RecommendedProductController>()
                                          //         .recommendedProductList
                                          //         .indexOf(_cartList[index]
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                dimensions.size20,
                                              ),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: dimensions.size20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              big_font(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54,
                                              ),
                                              small_font(text: 'Spicey'),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  big_font(
                                                    text: "\$ " +
                                                        cartController
                                                            .getItems[index]
                                                            .price
                                                            .toString(),
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
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.4),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 5.0,
                                                          ),
                                                          child: big_font(
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.4),
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
                    ),
                  )
                : no_items_page(
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
            child: cartController.getItems.length > 0
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
                              child: big_font(
                                text:
                                    '₹' + cartController.totalAmount.toString(),
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
                            color: Color.fromARGB(255, 34, 18, 156),
                          ),
                          child: big_font(
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
