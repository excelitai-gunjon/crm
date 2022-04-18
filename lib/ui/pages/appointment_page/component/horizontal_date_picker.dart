import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Tutorial',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Home(),
//     );
//   }
// }

class HorizontalDateView extends StatefulWidget {
  const HorizontalDateView({Key? key}) : super(key: key);
  @override
  HorizontalDateViewState createState() => HorizontalDateViewState();
}

class HorizontalDateViewState extends State<HorizontalDateView> {
  String? selectDate, selectDay;
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
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
                  itemBuilder: (ctx, position) {
                    int day = DateTime.now().day + position;
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
                                            ? selected ==
                                            DateTime.now().day
                                            ? Colors.transparent
                                            : Colors.grey
                                            : Colors.transparent),
                                    color: day == DateTime.now().day + 1
                                        ? const Color(0xffDA8DD5)
                                        : Colors.grey.withOpacity(0.1),
                                    borderRadius:
                                    BorderRadius.circular(25)),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        DateFormat('EE').format(
                                            DateTime.now().add(
                                                Duration(days: position))),
                                        style: TextStyle(
                                            color: day ==
                                                DateTime.now().day + 1
                                                ? Colors.white
                                                : Colors.grey[700],
                                            fontWeight:
                                            day == DateTime.now().day
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
                                          fontWeight:
                                          day == DateTime.now().day
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color:
                                          day == DateTime.now().day + 1
                                              ? Colors.white
                                              : Colors.grey[500],
                                        ),
                                      ),
                                    ]))),
                        onTap: () {
                          setState(() {
                            selectDate = DateTime.now()
                                .add(Duration(days: position))
                                .day
                                .toString();
                            selectDay = DateFormat('EE').format(
                                DateTime.now()
                                    .add(Duration(days: position)));

                            selected = DateTime.now().day + position;
                            if (kDebugMode) {
                              print('Tag' + selected.toString());
                            }
                          });
                        });
                  }
                  )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //height: ScreenUtil().setHeight(50),
                width: ScreenUtil().screenWidth*.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("03:00 pm",style: TextStyle(
                    fontSize: ScreenUtil().setSp(15)
                  ),),
                )
                ),
              ),
              Container(
                //height: ScreenUtil().setHeight(50),
                width: ScreenUtil().screenWidth*.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("03:00 pm",style: TextStyle(
                      fontSize: ScreenUtil().setSp(15)
                  ),),
                )
                ),
              ),
              Container(
                //margin: EdgeInsets.symmetric(vertical: 20),
                //height: ScreenUtil().setHeight(50),
                width: ScreenUtil().screenWidth*.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("03:00 pm",style: TextStyle(
                      fontSize: ScreenUtil().setSp(15)
                  ),),
                )
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //height: ScreenUtil().setHeight(50),
                width: ScreenUtil().screenWidth*.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("03:00 pm",style: TextStyle(
                      fontSize: ScreenUtil().setSp(15)
                  ),),
                )
                ),
              ),
              Container(
                //height: ScreenUtil().setHeight(50),
                width: ScreenUtil().screenWidth*.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("03:00 pm",style: TextStyle(
                      fontSize: ScreenUtil().setSp(15)
                  ),),
                )
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ]
    );
  }
}
