import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';

import '../../widgets/big_font.dart';
import '../../widgets/reusable_icons.dart';

class MedDetailPage extends StatelessWidget {
  const MedDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
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
                      // onTap: () {
                      //   Get.toNamed(RouteHelper.getInitial());
                      // },
                      child: const ReusableIcon(icon: Icons.clear)),
                  //ReusableIcon(icon: Icons.shopping_cart_outlined),
                  GestureDetector(
                    // onTap: () {
                    //   Get.toNamed(RouteHelper.getCartPage());
                    // },
                    child: Stack(
                      children: const [
                        ReusableIcon(icon: Icons.shopping_cart_outlined),
                        // controller.totalItems >= 1?
                        //      Positioned(
                        //         right: 0,
                        //         top: 0,
                        //         child: ReusableIcon(
                        //           icon: Icons.circle,
                        //           size: 20,
                        //           iconColor: Colors.transparent,
                        //           backgroundColor: AppColors.mainColor,
                        //         ),
                        //       )
                        //     : Container(),
                        // Get.find<PopularProductController>().totalItems >= 1
                        //     ? Positioned(
                        //         right: 3,
                        //         top: 3,
                        //         child: big_font(
                        //           text: Get.find<PopularProductController>()
                        //               .totalItems
                        //               .toString(),
                        //           size: 12,
                        //           color: Colors.white,
                        //         ),
                        //       )
                        //     : Container()
                      ],
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kBGColor,
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensions.size20),
                      topRight: Radius.circular(dimensions.size20),
                    ),
                  ),
                  child: BigFont(
                    text: "Paracetamol",
                    size: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: kPrimaryColor,
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "images/Paracetamol.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: dimensions.size10,
                    ),
                    child: SmallFont(
                        text:
                            "Paracetamol is a commonly used medicine that can help treat pain and reduce a high temperature (fever).It's typically used to relieve mild or moderate pain, such as headaches, toothache or sprains, and reduce fevers caused by illnesses such as colds and flu.Paracetamol is often recommended as one of the first treatments for pain, as it's safe for most people to take and side effects are rare.",
                        size: dimensions.size15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
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
                          // onTap: () {
                          //   popularProduct.setQuantity(false);
                          // },
                          child: const Icon(Icons.remove, color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: BigFont(
                          //text: popularProduct.inCartItems.toString()
                          text: "3",
                        ),
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   popularProduct.setQuantity(true);
                        // },
                        child: const Icon(Icons.add, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  // onTap: () {
                  //   controller.addItem(product);
                  // },
                  child: Container(
                    padding: EdgeInsets.all(dimensions.size20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimensions.size20),
                      color: kPrimaryColor,
                    ),
                    child: BigFont(
                      text: '₹120 | Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
