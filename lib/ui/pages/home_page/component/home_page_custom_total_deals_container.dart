import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';
import 'home_page_Custom_total_deals_tab.dart';

class CustomTopDealsContainer extends StatelessWidget {
  CustomTopDealsContainer({Key? key,this.size}) : super(key: key);
  Size? size;
  @override
  Widget build(BuildContext context) {
    final totalDealsTabState = Provider.of<TotalDealsTabState>(context);
    return Container(
      //height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      //color: Colors.deepPurple,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.deepPurple,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Total Appointment",
                          style: TextStyle(
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.end,
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons
                                .arrow_downward),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons
                                .calendar_today_sharp),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                totalDealsTabState
                                    .setTotalDealsTabValue(
                                    1);
                              },
                              child: Container(
                                height: size!.height,
                                width: size!.width,
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      right: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Weekly",
                                        style:
                                        TextStyle(
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color:totalDealsTabState.totalDealsTabValue==1?Colors.deepPurple:const Color(0xffCBB5EC),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(
                                            8.0),
                                        child:
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(
                                              context)
                                              .size
                                              .width,
                                          color: totalDealsTabState.totalDealsTabValue==1?Colors
                                              .deepPurple:Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                totalDealsTabState
                                    .setTotalDealsTabValue(
                                    2);
                              },
                              child: Container(
                                height: size!.height,
                                width: size!.width,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Monthly",
                                      style:
                                      TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                        color: totalDealsTabState.totalDealsTabValue==2?Colors.deepPurple:const Color(0xffCBB5EC),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(
                                          8.0),
                                      child:
                                      Container(
                                        height: 3,
                                        width: MediaQuery.of(
                                            context)
                                            .size
                                            .width,
                                        color: totalDealsTabState.totalDealsTabValue==2?Colors
                                            .deepPurple:Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                totalDealsTabState
                                    .setTotalDealsTabValue(
                                    3);
                                if (kDebugMode) {
                                  print(totalDealsTabState
                                      .totalDealsTabValue
                                      .toInt());
                                }
                              },
                              child: Container(
                                height: size!.height,
                                width: size!.width,
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      left: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Yearly",
                                        style:
                                        TextStyle(
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color: totalDealsTabState.totalDealsTabValue==3?Colors.deepPurple:const Color(0xffCBB5EC),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(
                                            8.0),
                                        child:
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(
                                              context)
                                              .size
                                              .width,
                                          color: totalDealsTabState.totalDealsTabValue==3?Colors
                                              .deepPurple:Colors.white,
                                        ),
                                      )
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
            const CustomTotalDealsTab(),
          ],
        ),
      ),
    );
  }
}
