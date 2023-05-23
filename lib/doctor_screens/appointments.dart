import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/constants.dart';

import 'package:tele_med/widgets/dimensions.dart';
import 'package:tele_med/widgets/small_font.dart';
class appointments extends StatefulWidget {
  const appointments({Key? key}) : super(key: key);

  @override
  State<appointments> createState() => _appointmentsState();
}



class _appointmentsState extends State<appointments> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBGColor,
        body: SingleChildScrollView(
          child: Container(
            
            padding: EdgeInsets.all(dimensions.size15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: dimensions.size10 / 3,
                ),
                GestureDetector(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      BigFont(
                        text: "16 Appointments",
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: dimensions.size20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallFont(
                  text: "Requested",
                  fontWeight: FontWeight.w500,
                ),
                SmallFont(
                  text: "Completed",
                  fontWeight: FontWeight.w500,
                ),
                SmallFont(
                  text: "Cancelled",
                  fontWeight: FontWeight.w500,
                ),
                  ],
                ),
                SizedBox(
                  height: dimensions.size20,
                ),
                
                
                
                
                
                  Container(
                          width: double.maxFinite,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, position) {
                              return _buildAppointmentItem(
                                  position);
                            },
                          ),
                        )
                      
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget  _buildAppointmentItem(int index) {
    
    return Stack(
      children: [
        GestureDetector(
          
          child: Container(
            padding: EdgeInsets.all(dimensions.size10),
            height: dimensions.size20 * 8,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimensions.size15),
              color: Colors.white,
              boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(
                              0, 3), // changes the shadow direction vertically
                        ),
                      ],
            ),
            child: Column(
              
              children: [
                SizedBox(height: dimensions.size15*3.5,),
                Row(
                  children: [
                    CircleAvatar(radius:dimensions.size25,backgroundColor: Colors.grey,child: Icon(Icons.person,size: dimensions.size25,color: Colors.black,),),
                   SizedBox(
                    width: dimensions.size10,
                   ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallFont(text: "Dibya Ranjan Sahu",fontWeight: FontWeight.w600,),
                        SizedBox(height: dimensions.size10/3,),
                        Row(
                          
                          children: [
                            
                            Container(
                              height: dimensions.size15,
                              width: dimensions.size15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(dimensions.size10),
                                child: Image.asset("assets/images/stethoscope.png",))),
                                SizedBox(width: dimensions.size10/3,),
                            SmallFont(text: "Cold & Cough",fontWeight: FontWeight.w500,size: 10,),
                            SizedBox(width: dimensions.size20,),
                            Icon(Icons.info,size: dimensions.size15,color: Colors.black,),
                            SmallFont(text: "36 years, Male (O+)",fontWeight: FontWeight.w500,size: 10,),


                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: dimensions.size15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: dimensions.size25+dimensions.size10/1.3,
                      width: dimensions.size15*4.7,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 91, 169, 161).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(dimensions.size15)
                      ),
                      child: Center(child: SmallFont(text: "Reschedule",size: 12,fontWeight: FontWeight.w600,color: Colors.teal,)),
                    ),
                    Container(
                      height: dimensions.size25+dimensions.size10/1.3,
                      width: dimensions.size15*4.7,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 215, 68, 68).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(dimensions.size15)
                      ),
                      child: Center(child: SmallFont(text: "Reject",size: 12,fontWeight: FontWeight.w600,color: Colors.red,)),
                    ),
                    Container(
                      height: dimensions.size25+dimensions.size10/1.3,
                      width: dimensions.size15*4.7,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 104, 212, 122).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(dimensions.size15)
                      ),
                      child: Center(child: SmallFont(text: "Accept",size: 12,fontWeight: FontWeight.w600,color: Colors.green,)),
                    )

                  ],

                )
              ],
            ),
            
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(left: dimensions.size15,top: dimensions.size10/1.5),
              decoration: BoxDecoration(
                  
                  color: Color.fromARGB(255, 132, 203, 203),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimensions.size15),
                      topRight: Radius.circular(dimensions.size15))),
              height: dimensions.size20 * 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallFont(text: "Appointment Request!",color: Colors.teal[900],fontWeight: FontWeight.w600,size: dimensions.size10+dimensions.size10/5,),
                  SizedBox(height: dimensions.size10/2,),
                  Row(
                    children: [
                      Icon(Icons.timelapse,size: dimensions.size15,color: Colors.black,),
                      SizedBox(width: dimensions.size10),
                      SmallFont(text: "16 May 2023, 10:30am-10:45am",color: Colors.black,fontWeight: FontWeight.w600,size: dimensions.size10,),
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