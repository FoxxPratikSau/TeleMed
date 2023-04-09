import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
            Container(
              height: dimensions.size100,
              color: Colors.white,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return _buildcatagoriesItem(position);
                  }),
            ),
            SizedBox(
              height: dimensions.size15,
            ),
            Text(
              "Top Ranking Doctors",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dimensions.size15,
            ),
            Expanded(
              child: Container(
                width: dimensions.size300,
                color: Colors.white,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, position) {
                      return _builddoctorsItem(position);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildcatagoriesItem(int index) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: dimensions.size30 * 3,
            width: dimensions.size30 * 3,
            margin: EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimensions.size20),
                color: Color.fromARGB(255, 211, 211, 211).withOpacity(0.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.health_and_safety_outlined,
                  size: dimensions.size25 * 2.5,
                ),
                Text(
                  "Ear",
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

  Widget _builddoctorsItem(int index) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: dimensions.size20 * 4,
            width: dimensions.size300,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimensions.size15),
                color: Color.fromARGB(255, 211, 211, 211).withOpacity(0.5)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(left: dimensions.size10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimensions.size15),
                      color: Color.fromARGB(255, 7, 18, 95)),
                  child: Icon(
                    Icons.person,
                    size: dimensions.size25 * 2,
                    color: Colors.white,
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
                      small_font(text: "Cardiologist"),
                      Text(
                        "Dr.Dibya Ranjan Sahu",
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
