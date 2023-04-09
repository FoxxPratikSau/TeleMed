import 'package:tele_med/screens/medicine_details.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tele_med/widgets/small_font.dart';

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
      backgroundColor: const Color.fromARGB(255, 189, 217, 231),
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
              child: BigFont(
                textAlign: TextAlign.left,
                text: "Buy Medicines",
                color: const Color.fromARGB(255, 34, 18, 156),
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
                            color: const Color.fromARGB(255, 29, 60, 146),
                            borderRadius:
                                BorderRadius.circular(dimensions.size10)),
                        child: const Icon(
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
            SizedBox(
              height: dimensions.size260,
              child: PageView.builder(
                controller: pageController,
                itemCount: 6,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                },
              ),
            ),
            SizedBox(
              height: dimensions.size15,
            ),
            DotsIndicator(
              dotsCount: 6,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: const Color.fromARGB(255, 34, 18, 156),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),

            //Popular text*********************************************
            SizedBox(height: dimensions.size10),
            Container(
              margin: EdgeInsets.only(left: dimensions.size30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigFont(text: 'New Stock'),
                  SizedBox(width: dimensions.size10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigFont(text: '.', color: Colors.black26),
                  ),
                ],
              ),
            ),
            //Recommended food*****************************
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedDetailPage(),
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
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 253, 208, 200),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/saridon.png")),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: dimensions.size45 * 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(dimensions.size20),
                                  bottomRight:
                                      Radius.circular(dimensions.size20),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: dimensions.size10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    BigFont(text: "Saridon"),
                                    SmallFont(text: 'Triple Action'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MedDetailPage(),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/Paracetamol.jpg"),
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
                    color: const Color.fromARGB(255, 29, 50, 144),
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
                          text: "Paracetamol",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: dimensions.size15 / 5,
                        ),
                        SmallFont(
                          text: "650Mg",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: dimensions.size15 / 5,
                        ),
                        BigFont(
                          text: "₹ 60",
                          color: Colors.white,
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
