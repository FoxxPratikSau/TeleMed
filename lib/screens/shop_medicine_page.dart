import 'package:tele_med/constants.dart';
import 'package:tele_med/screens/medicine_details.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:tele_med/models/medicines.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/screens/medicine_details2.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/medicines_controller.dart';

class ShopMedicinePage extends StatefulWidget {
  const ShopMedicinePage({Key? key}) : super(key: key);

  @override
  State<ShopMedicinePage> createState() => _ShopMedicinePageState();
}

class _ShopMedicinePageState extends State<ShopMedicinePage> {
  PageController pageController = PageController(viewportFraction: 0.65);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = dimensions.size260;
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
      backgroundColor: kBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: dimensions.size30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: dimensions.size15, right: dimensions.size15),
                child: BigFont(
                  textAlign: TextAlign.left,
                  text: "Buy Medicines",
                  color: const Color.fromARGB(255, 2, 2, 119),
                  size: dimensions.size30,
                  fontWeight: FontWeight.bold,
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
                      hintStyle: const TextStyle(fontSize: 17),
                      hintText: 'Search ,e.g. Paracetamol',
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 2, 2, 119),
                            borderRadius:
                                BorderRadius.circular(dimensions.size10)),
                        child: GestureDetector(
                          onTap: null,
                          child: Image.asset(
                            'images/search.png',
                            scale: 17.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
              GetBuilder<medicine_controller>(
                builder: (medicineList) {
                  return SizedBox(
                    height: dimensions.size260,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: medicineList.medicine_items.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position, medicineList.medicine_items[position]);
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: dimensions.size15,
              ),
              GetBuilder<medicine_controller>(
                builder: (medicineList) {
                  return DotsIndicator(
                    dotsCount: medicineList.medicine_items.length,
                    position: _currentPageValue,
                    decorator: DotsDecorator(
                      activeColor: const Color.fromARGB(255, 34, 18, 156),
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  );
                },
              ),

              //Popular text*********************************************
              SizedBox(height: dimensions.size10),
              Container(
                margin: EdgeInsets.only(left: dimensions.size20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BigFont(
                      text: 'New Stock',
                      size: 28,
                    ),
                  ],
                ),
              ),
              SizedBox(height: dimensions.size20),

              //Recommended food*****************************
              GetBuilder<medicine_controller>(builder: (medicines) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final medicineIndex = medicines.medicine_items2[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MedDetailPage2(pageId: index),
                            ),
                          );
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
                                  color:
                                      const Color.fromARGB(255, 253, 208, 200),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(medicineIndex.image!)),
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
                                    padding: EdgeInsets.only(
                                        left: dimensions.size10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        BigFont(text: medicineIndex.name!),
                                        SmallFont(
                                          text:
                                              "₹ ${medicineIndex.price.toString()}",
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
      ),
    );
  }

  Widget _buildPageItem(int index, medicine medicineItem) {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedDetailPage(
                    pageId: index,
                  ),
                ),
              );
            },
            child: Container(
              height: dimensions.size210,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xff69c5df)
                    : const Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(medicineItem.image!),
                ),
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
                    gradient: LinearGradient(
                      colors: [
                        kPrimaryColor,
                        const Color(0xFF000030),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: dimensions.size15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: dimensions.size15 / 2,
                        ),
                        BigFont(
                          text: medicineItem.name!,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: dimensions.size15 / 5,
                        ),
                        BigFont(
                          text: "₹ ${medicineItem.price.toString()}",
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
