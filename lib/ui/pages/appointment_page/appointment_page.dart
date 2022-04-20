import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/appointment_page2.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/custom_clipper_background_bottom.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/custom_clipper_background_upper.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/custom_tag.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/date_and_time_picker.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  DateTime selectedDate = DateTime.now();
  String formattedDate =DateFormat('MMM y').format(DateTime.now());
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('MMM y').format(selectedDate);
        //formattedDate = DateFormat('kk:mm:ss \n EEE d MMM YYYY').format(selectedDate);
      });
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                color: const Color(0xffEAFFA8),
                child: Stack(
                  children: [
                    ClipPath(
                      //clipBehavior: CustomClipperBackground(),
                      clipper: CustomClipperBackgroundUpper(),
                      child: Container(
                        height: ScreenUtil().screenHeight,
                        width: ScreenUtil().screenWidth,
                        color: const Color(0xff7EC1FE),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipPath(
                        clipper: CustomClipperBackgroundBottom(),
                        child: Container(
                          //clipBehavior: ,
                          height: 100,
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      right: 0,
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: ScreenUtil().setHeight(150),
                        width: ScreenUtil().screenWidth,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 2.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffedeceb),
                                        Colors.white,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 1,
                                        offset: const Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Dr. Shahid Mahamum",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(12),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star_outline,
                                                      size: ScreenUtil()
                                                          .setSp(12),
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      "4.5",
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Text("Family Physicians"),
                                        Row(
                                          children: [
                                            CustomTag(
                                              tag: "tag1",
                                            ),
                                            CustomTag(
                                              tag: "tag1",
                                            ),
                                            CustomTag(
                                              tag: "tag1",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: const [
                                                Text(
                                                  "\$30",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                                Text(
                                                  "Per Hour",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.label_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2.5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2.5),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffedeceb),
                                              Colors.white,
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 1,
                                              offset: const Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Icon(Icons
                                                        .perm_identity_outlined),
                                                    Text("Licence No"),
                                                  ],
                                                ),
                                                Text(
                                                  "0389490478",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 2.5),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffedeceb),
                                              Colors.white,
                                            ],
                                          ),
                                          color: Colors.tealAccent,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 1,
                                              offset: const Offset(
                                                0,
                                                2,
                                              ), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Icon(Icons
                                                        .perm_identity_outlined),
                                                    Text("Experience"),
                                                  ],
                                                ),
                                                Text(
                                                  "5 years",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 2,),
                child: SizedBox(
                  //color: Colors.red,
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Dr. Shahid Mahamum",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Leukemia, also spelled leukaemia, is a group of blood cancers that usually begin in the bone marrow and result in high numbers of abnormal blood cells. These blood cells are not fully developed and are called blasts or leukemia cells.Symptoms may include bleeding and bruising, feeling tired, fever, and an increased risk of infections.These symptoms occur due to",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () => _selectDate(context),
                      //   child: Row(
                      //     children: [
                      //       Text(formattedDate.toString(),style: TextStyle(
                      //         fontSize: ScreenUtil().setSp(20),
                      //         fontWeight: FontWeight.bold,
                      //       ),),
                      //       const Icon(Icons.keyboard_arrow_down_outlined),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(
                    Colors.red
                ),
                //fixedSize: MaterialStateProperty.all<Size>(Size.infinite),
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Colors.red)
                    )
                )
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage2()));
            },
            child: const Text("Appointment"),
          ),
        ),
      ),
    );
  }
}
