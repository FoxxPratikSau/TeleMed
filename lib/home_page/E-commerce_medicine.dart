import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';
import 'package:tele_med/home_page/medicine_details.dart';
import 'package:tele_med/home_page/medicine_details2.dart';
import 'package:tele_med/models/medicines.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tele_med/widgets/small_font.dart';

class e_commerce_medicine extends StatefulWidget {
  const e_commerce_medicine({Key? key}) : super(key: key);

  @override
  State<e_commerce_medicine> createState() => _e_commerce_medicineState();
}

class _e_commerce_medicineState extends State<e_commerce_medicine> {
  PageController pageController = PageController(viewportFraction: 0.65);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = dimensions.size260;
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 217, 231),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: dimensions.size45,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: dimensions.size15, right: dimensions.size15),
              child: Text(
                textAlign: TextAlign.left,
                "Buy Medicines",
                style: TextStyle(
                  color: Color.fromARGB(255, 34, 18, 156),
                  fontSize: dimensions.size30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: dimensions.size20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: dimensions.size15, right: dimensions.size15),
              child: Container(
                height: dimensions.size20 * 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(dimensions.size10),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Search ,e.g. Paracetamol',
                    suffixIcon: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 29, 60, 146),
                            borderRadius:
                                BorderRadius.circular(dimensions.size10)),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(dimensions.size10),
                  ),
                  onChanged: (value) {
                    search = value;
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(
              height: dimensions.size30,
            ),
            GetBuilder<medicine_controller>(builder: (medicineList) {
              return Container(
                height: dimensions.size260,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: medicineList.medicine_items.length,
                    itemBuilder: (context, position) {
                      final medicine_index1 =
                          medicineList.medicine_items[position];
                      return _buildPageItem(
                          position, medicineList.medicine_items[position]);
                    }),
              );
            }),

            SizedBox(
              height: dimensions.size15,
            ),
            GetBuilder<medicine_controller>(builder: (medicineList) {
              return DotsIndicator(
                dotsCount: medicineList.medicine_items.length,
                position: _currentPageValue,
                decorator: DotsDecorator(
                  activeColor: Color.fromARGB(255, 34, 18, 156),
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),

            //Popular text*********************************************
            SizedBox(height: dimensions.size10),
            Container(
              margin: EdgeInsets.only(left: dimensions.size30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  big_font(text: 'New Stock'),
                  SizedBox(width: dimensions.size10),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: big_font(text: '.', color: Colors.black26),
                  ),
                ],
              ),
            ),
            //Recommended food*****************************
            GetBuilder<medicine_controller>(builder: (medicines) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: medicines.medicine_items2.length,
                  itemBuilder: (context, index) {
                    final medicine_index = medicines.medicine_items2[index];
                    return GestureDetector(
                      // onTap: () {
                      //   Get.toNamed(RouteHelper.getRecommendedFood(index));
                      // },
                      onTap: () {
                        Get.to(medicine_details2(pageId: index));
                        print(medicines.medicine_items.length);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: dimensions.size15,
                            right: dimensions.size10 * 2),
                        child: Row(
                          children: [
                            //image section**************
                            Container(
                              width: dimensions.size45 * 2,
                              height: dimensions.size45 * 2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 253, 208, 200),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(medicine_index.image!)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: dimensions.size45 * 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(dimensions.size20),
                                    bottomRight:
                                        Radius.circular(dimensions.size20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: dimensions.size10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      big_font(text: medicine_index.name!),
                                      big_font(
                                        text: "₹" +
                                            medicine_index.price.toString(),
                                        color: Colors.red,
                                        size: dimensions.size25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index, medicine medicine_item) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            // onTap: () {
            //   Get.toNamed(
            //     RouteHelper.getPopularFood(index, 'home'),
            //   );
            // },
            onTap: () {
              Get.to(medicine_details(
                pageId: index,
              ));
            },
            child: Container(
              height: dimensions.size210,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(medicine_item.image!)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.circular(dimensions.size20),
              child: Container(
                  height: dimensions.size45 * 2,
                  width: dimensions.size110 + dimensions.size30 * 2,
                  //margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimensions.size20),
                    color: Color.fromARGB(255, 29, 50, 144),
                  ),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: dimensions.size15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: dimensions.size15 / 2,
                          ),
                          big_font(
                            text: medicine_item.name!,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: dimensions.size15 / 2,
                          ),
                          big_font(
                            text: "₹" + medicine_item.price.toString(),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
