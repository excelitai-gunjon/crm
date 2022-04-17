import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/appointment_page.dart';

class HomePageTabBar extends StatelessWidget {
  const HomePageTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageTabState = Provider.of<HomePageTabState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              homePageTabState.setHomePageTabBarValue(1);
              if (kDebugMode) {
                print(homePageTabState.homePageTabValue.toInt());
              }
            },
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffF5F5FB),
                            ),
                            child: const Icon(
                              Icons.people,
                              size: 12,
                              color: Color(0xff6F2BCE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff6F2BCE),
                                  fontSize: 8.sp,
                                ),
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * .18,
                      color: homePageTabState.homePageTabValue == 1
                          ? const Color(0xffFFA45A)
                          : Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homePageTabState.setHomePageTabBarValue(2);
              if (kDebugMode) {
                print(homePageTabState.homePageTabValue.toInt());
              }
            },
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffF5F5FB),
                            ),
                            child: const Icon(
                              Icons.rocket,
                              size: 12,
                              color: Color(0xff6F2BCE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Projects",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff6F2BCE),
                                  fontSize: 8.sp,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * .18,
                      color: homePageTabState.homePageTabValue == 2
                          ? const Color(0xffFFA45A)
                          : Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //homePageTabState.setHomePageTabBarValue(3);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage()));
              if (kDebugMode) {
                print(homePageTabState.homePageTabValue.toInt());
              }
            },
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffF5F5FB),
                            ),
                            child: const Icon(
                              Icons.local_dining_rounded,
                              size: 12,
                              color: Color(0xff6F2BCE),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              "Appointment",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff6F2BCE),
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * .18,
                      color: homePageTabState.homePageTabValue == 3
                          ? const Color(0xffFFA45A)
                          : Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
