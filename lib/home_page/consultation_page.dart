import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/catagories_controller.dart';
import 'package:tele_med/helpers_n_controllers/doctorList_controller.dart';
import 'package:tele_med/models/catagories.dart';
import 'package:tele_med/models/doctors.dart';
import 'package:tele_med/screens/doc_profile.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';

class consultation_page extends StatefulWidget {
  const consultation_page({super.key});

  @override
  State<consultation_page> createState() => _consultation_pageState();
}

final searchController = TextEditingController();
String search = "";

class _consultation_pageState extends State<consultation_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: dimensions.size20,
            right: dimensions.size20,
            top: dimensions.size15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: dimensions.size45,
            ),
            Text(
              "Consult a Doctor",
              style: TextStyle(
                fontSize: dimensions.size30 + dimensions.size10 / 3,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: dimensions.size20,
            ),
            Container(
              height: dimensions.size20 * 2,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
                borderRadius: BorderRadius.circular(dimensions.size10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Search ,e.g. Dr.Bhagad Billa',
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
            SizedBox(
              height: dimensions.size30,
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dimensions.size15,
            ),
            GetBuilder<catagories_controller>(builder: (controller) {
              return Container(
                height: dimensions.size100,
                color: Colors.white,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.catagorylist.length,
                    itemBuilder: (context, position) {
                      return _buildcatagoriesItem(
                          position, controller.catagorylist[position]);
                    }),
              );
            }),
            SizedBox(
              height: dimensions.size15,
            ),
            Text(
              "Featured Doctors",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dimensions.size15,
            ),
            GetBuilder<doctorList_controller>(builder: (controller) {
              return Expanded(
                child: Container(
                  width: dimensions.size300,
                  color: Colors.white,
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
    );
  }

  Widget _buildcatagoriesItem(int index, Category catagorylist) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: dimensions.size30 * 3,
            width: dimensions.size30 * 3,
            margin: EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimensions.size20),
                color: Color.fromARGB(255, 189, 217, 231)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      child: Image.asset(
                        catagorylist.image!,
                        fit: BoxFit.cover,
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimensions.size15),
                    color: Color.fromARGB(255, 189, 217, 231),
                  ),
                ),
                Text(
                  catagorylist.name!,
                  style: TextStyle(
                    fontSize: dimensions.size15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimensions.size15),
                color: Color.fromARGB(255, 189, 217, 231)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  margin: EdgeInsets.only(left: dimensions.size10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      child: Image.asset(
                        doctorlist.image!,
                        fit: BoxFit.cover,
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimensions.size15),
                    color: Color.fromARGB(255, 7, 18, 95),
                  ),
                ),
                SizedBox(
                  width: dimensions.size15,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallFont(text: doctorlist.prof!),
                      Text(
                        doctorlist.name!,
                        style: TextStyle(
                          fontSize: dimensions.size15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: dimensions.size10 / 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.green,
                            size: dimensions.size10,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                            size: dimensions.size10,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                            size: dimensions.size10,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                            size: dimensions.size10,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                            size: dimensions.size10,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
