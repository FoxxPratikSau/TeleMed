import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/widgets/constants.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/screens/no_items_page.dart';
import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tele_med/essentials/auth_service.dart';

class CartPage extends StatefulWidget {
  final loginController = Get.find<AuthService>();
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    razorpay.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 217, 231),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: 45,
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
                    top: 30 * 3.5,
                    left: 20,
                    right: 20,
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
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.all(10),
                                  height: 20 * 5,
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
                                          width: 20 * 5,
                                          height: 20 * 5,
                                          margin: EdgeInsets.only(
                                            right: 10,
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
                                              20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        height: 20 * 5,
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
                                                    10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text('QTY '),
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
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: 100,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20 * 2),
                  topRight: Radius.circular(20 * 2),
                )),
            child: cartController.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                        onTap: () {
                          var options = {
                            'key': 'rzp_test_Tn7MWOXGjqVPbn',
                            'amount': cartController.totalAmount * 100,
                            "currency": "INR",
                            'name': 'TeleMed',
                            'description': 'Buy Medicines',
                            'image': 'images/TelemedLogo.png',
                            'prefill': {
                              'name':
                                  widget.loginController.returnUserData().name,
                              'contact': widget.loginController
                                  .returnUserData()
                                  .phoneNumber,
                              'email':
                                  widget.loginController.returnUserData().email
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          try {
                            razorpay.open(options);
                          } catch (e) {
                            debugPrint('Error: $e');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                : Container(),
          );
        },
      ),
    );
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    QuickAlert.show(
      context: context,
      title: 'Transaction Successful!',
      type: QuickAlertType.success,
      text: 'Payment ID: ${response.paymentId}',
      confirmBtnColor: const Color.fromARGB(255, 34, 18, 156),
    );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Transaction Failed',
      text: '${response.message}',
      confirmBtnColor: const Color.fromARGB(255, 34, 18, 156),
    );
  }

  handleExternalWallet() {}
}
