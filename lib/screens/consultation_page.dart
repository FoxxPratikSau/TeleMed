import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';
import 'package:tele_med/constants.dart';
import 'package:tele_med/screens/doc_profile.dart';
import 'package:tele_med/models/catagories.dart';
import 'package:tele_med/models/doctors.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({super.key});

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

final searchController = TextEditingController();
String search = "";

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: dimensions.size20,
              right: dimensions.size20,
              top: dimensions.size15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: dimensions.size20,
              ),
              BigFont(
                text: "Consult a Doctor",
                size: dimensions.size30,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: dimensions.size20,
              ),
              Container(
                height: dimensions.size20 * 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(dimensions.size10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(fontSize: 17),
                    hintText: 'Search ,e.g. Dr.Bhagad Billa',
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
              SizedBox(
                height: dimensions.size30,
              ),
              BigFont(
                text: "Categories",
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: dimensions.size15,
              ),
              GetBuilder<catagories_controller>(
                builder: (controller) {
                  return Container(
                    height: dimensions.size100,
                    color: kBGColor,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.catagorylist.length,
                      itemBuilder: (context, position) {
                        return _buildcatagoriesItem(
                            position, controller.catagorylist[position]);
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: dimensions.size15,
              ),
              BigFont(
                text: "Featured Doctors",
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: dimensions.size15,
              ),
              GetBuilder<doctorList_controller>(builder: (controller) {
                return Expanded(
                  child: Container(
                    width: dimensions.size300,
                    color: kBGColor,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.doctorlist.length,
                        itemBuilder: (context, position) {
                          return _builddoctorsItem(
                              position, controller.doctorlist[position]);
                        }),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _builddoctorsItem(int index, Doctor doctorlist) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(DocProfilePage(pageId: index));
          },
          child: Container(
            height: dimensions.size20 * 4,
            width: dimensions.size300,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimensions.size15),
              color: const Color.fromARGB(255, 189, 217, 231),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(left: dimensions.size10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      color: const Color.fromARGB(255, 7, 18, 95)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(dimensions.size15),
                    child: Image.asset(
                      doctorlist.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: dimensions.size15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallFont(
                      text: doctorlist.prof!,
                      fontWeight: FontWeight.w600,
                    ),
                    SmallFont(
                      text: doctorlist.name!,
                      size: dimensions.size15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: dimensions.size10 / 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                          size: dimensions.size10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                          size: dimensions.size10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                          size: dimensions.size10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                          size: dimensions.size10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                          size: dimensions.size10,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildcatagoriesItem(int index, Category catagorylist) {
  return Stack(
    children: [
      GestureDetector(
        child: Container(
          height: dimensions.size30 * 3,
          width: dimensions.size30 * 3,
          margin: const EdgeInsets.only(left: 10, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimensions.size20),
              color: const Color.fromARGB(255, 189, 217, 231)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimensions.size15),
                  color: const Color.fromARGB(255, 189, 217, 231),
                ),
                child: Image.asset(
                  catagorylist.image!,
                  fit: BoxFit.cover,
                ),
              ),
              SmallFont(
                text: catagorylist.name!,
                size: dimensions.size15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
