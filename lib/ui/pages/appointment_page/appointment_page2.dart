import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shahid_mahamum_sir/example/expandable_text.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/horizontal_date_picker.dart';

import 'component/custom_appointment_button.dart';

class AppointmentPage2 extends StatefulWidget {
  const AppointmentPage2({Key? key}) : super(key: key);

  @override
  _AppointmentPage2State createState() => _AppointmentPage2State();
}

class _AppointmentPage2State extends State<AppointmentPage2> {

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffAE91D5),
            Color(0xffE7EDFD),
            Color(0xffE8E2F6),
            Color(0xffFEFEFE),
            Color(0xffE7EEFE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: [0, 0, 0, 0.6, 1],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                SizedBox(
                  //color: Colors.amber,
                  height: ScreenUtil().screenWidth/2+50,//size.width / 2,
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              //color: Colors.green,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height: ScreenUtil().screenHeight,
                          width: ScreenUtil().screenWidth/2,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: ScreenUtil().screenWidth/2,
                                  width: ScreenUtil().screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.deepPurple,
                                        Colors.purpleAccent,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      //stops: [0, 0],
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset("image/Doctor.png"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8,right: 8,top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Dr.Shahid Mahamum",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(25),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Heart Surgeon",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  //crossAxisAlignment: Cro,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff7390EE),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff7390EE),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.video_call_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff7390EE),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: Row(
                                    children: [
                                      Text(formattedDate.toString(),style: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      const Icon(Icons.keyboard_arrow_down_outlined),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ExpandableText(
                  "Leukemia, also spelled leukaemia, is a group of blood cancers that usually begin in the bone marrow and result in high numbers of abnormal blood cells. These blood cells are not fully developed and are called blasts or leukemia cells.Symptoms may include bleeding and bruising, feeling tired, fever, and an increased risk of infections.These symptoms occur due to",
                  trimLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Row(
                    children: [
                      Text(formattedDate.toString(),style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold,
                      ),),
                      const Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HorizontalDateView(),

                const CustomAppointmentButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
