import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'appointment_data_error_provider.dart';

enum Time{
  time0,time1,time2,time3,time4,time5,time6,
}

class HorizontalDateView extends StatefulWidget {
  const HorizontalDateView({Key? key}) : super(key: key);
  @override
  HorizontalDateViewState createState() => HorizontalDateViewState();
}
class HorizontalDateViewState extends State<HorizontalDateView> {

  String? selectDate, selectDay;
  int? selected;
  bool isChecked = false;
  int groupValue = 0;
  Time selectTime=Time.time0;

  @override
  Widget build(BuildContext context){

    final appointmentErrorData=Provider.of<AppointmentErrorData>(context);
    TimeOfDay now = TimeOfDay.now();
    int nowInMinutes = now.hour * 60 + now.minute;
    print(nowInMinutes.toString()+">>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<");

    TimeOfDay testDate = TimeOfDay(hour: 2, minute: 20);
    int testDateInMinutes = testDate.hour * 60 + testDate.minute;
    print(testDateInMinutes.toString()+">>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<");


    return Column(children: [
      Container(
          height: 90,
          decoration: const BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, position){
                int day = DateTime.now().day+position;
                return GestureDetector(
                    child: FittedBox(
                        child: Container(
                            height: 100,
                            width: 90,
                            margin: const EdgeInsets.only(right: 15.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selected == null
                                        ? Colors.transparent
                                        : selected == day
                                            ? selected == DateTime.now().day
                                                ? Colors.transparent
                                                : const Color(0xffDA8DD5)
                                            : Colors.transparent
                                ),
                                color: day == DateTime.now().day
                                    ? const Color(0xffDA8DD5)
                                    : Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    DateFormat('EE').format(DateTime.now()
                                        .add(Duration(days: position))),
                                    style: TextStyle(
                                        color: day == DateTime.now().day + 1
                                            ? Colors.grey[700]
                                            : Colors.grey[700],
                                        fontWeight: day == DateTime.now().day
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                  Text(
                                    DateTime.now()
                                        .add(Duration(days: position))
                                        .day
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: day == DateTime.now().day
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: day == DateTime.now().day + 1
                                          ? Colors.grey[500]
                                          : Colors.grey[500],
                                    ),
                                  ),
                                ]))),
                    onTap: (){
                      setState((){
                        selectDate = DateTime.now()
                            .add(Duration(days: position))
                            .day
                            .toString();
                        selectDay = DateFormat('EE').format(
                            DateTime.now().add(Duration(days: position)));

                        selected = DateTime.now().day + position;
                        if (kDebugMode) {
                          print('Tag' + selected.toString());
                        }
                      });
                    }
                    );
              })),
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                if(nowInMinutes<(10*60)){
                  selectTime=Time.time1;
                  appointmentErrorData.setSelectTime();
                }
                //selectTime=Time.time2;
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10:00 am",
                      style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.orangeAccent
                          border: Border.all(width: 1, color: Colors.purple)),
                      child: selectTime==Time.time1?const Icon(
                        Icons.check,
                        size: 15,
                      ):Container(),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: (){
              TimeOfDay testDate = TimeOfDay(hour: 10, minute: 20);
              int testDateInMinutes = testDate.hour * 60 + testDate.minute;
              setState(() {
                if(nowInMinutes<(10*60+30)){
                  selectTime=Time.time2;
                  appointmentErrorData.setSelectTime();
                }
                //selectTime=Time.time2;
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10:30 am",
                      style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.orangeAccent
                          border: Border.all(width: 1, color: Colors.purple)),
                      child: selectTime==Time.time2?const Icon(
                        Icons.check,
                        size: 15,
                      ):Container(),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                if(nowInMinutes<(11*60+0)){
                  selectTime=Time.time3;
                  appointmentErrorData.setSelectTime();
                }
                //selectTime=Time.time3;
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "11:00 am",
                      style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.orangeAccent
                          border: Border.all(width: 1, color: Colors.purple)),
                      child: selectTime==Time.time3?const Icon(
                        Icons.check,
                        size: 15,
                      ):Container(),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                if(nowInMinutes<(17*60+0)){
                  selectTime=Time.time4;
                  appointmentErrorData.setSelectTime();
                }
                //selectTime=Time.time4;
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5:00 pm",
                      style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.orangeAccent
                          border: Border.all(width: 1, color: Colors.purple)),
                      child: selectTime==Time.time4?const Icon(
                        Icons.check,
                        size: 15,
                      ):Container(),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: (){
              TimeOfDay testDate = TimeOfDay(hour: 19, minute: 0);
              int testDateInMinutes = testDate.hour * 60 + testDate.minute;
              print(">>>>>>>>>>>>>"+"for 7:00pm "+testDateInMinutes.toString());
              setState(() {
                if(nowInMinutes<(19*60+0)){
                  selectTime=Time.time5;
                  appointmentErrorData.setSelectTime();
                }
                //selectTime=Time.time5;
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "7:00 pm",
                      style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //color: Colors.orangeAccent
                          border: Border.all(width: 1, color: Colors.purple)),
                      child: selectTime==Time.time5?const Icon(
                        Icons.check,
                        size: 15,
                      ):Container(),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                selectTime=Time.time6;
                appointmentErrorData.setSelectTime();
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().screenWidth * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10:00 pm",
                          style: TextStyle(fontSize: ScreenUtil().setSp(10)),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(20),
                          width: ScreenUtil().setWidth(20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //color: Colors.orangeAccent
                              border: Border.all(width: 1, color: Colors.purple)),
                          child: selectTime==Time.time6?const Icon(
                            Icons.check,
                            size: 15,
                          ):Container(),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
