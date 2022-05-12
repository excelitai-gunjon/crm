import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';
import 'package:shahid_mahamum_sir/ui/pages/home_page/component/home_page_tab.dart';
import 'package:shahid_mahamum_sir/ui/pages/home_page/component/home_page_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() =>_HomePageState();
}
class _HomePageState extends State<HomePage> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final totalDealsTabState = Provider.of<TotalDealsTabState>(context);
    final customScafoldKey = Provider.of<CustomScafoldKey>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        //key: customScafoldKey.scaffoldKey,
        child: Scaffold(
          key: customScafoldKey.scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildCustomProfileTile(context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(clipBehavior: Clip.none, children: [
                    HomePageTab(
                      size: size,
                    ),
                    const Positioned(
                      top: -20,
                      right: 0,
                      left: 0,
                      child: HomePageTabBar(),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: const Color(0xff36013f),
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
              child: Scrollbar(
                hoverThickness: 2,
                radius: const Radius.circular(15),
                isAlwaysShown: true,
                thickness: 12,
                child: ListView(
                  children: [
                    ListTile(
                        leading: const Icon(
                          Icons.medical_services_sharp,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          "Doctor",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ), onPressed: (){
                            Navigator.pop(context);
                        },
                        ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.task_alt_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "Entrepreneur",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.task_alt_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "CEO of Excel AI IT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.task_alt_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "MD",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildCustomProfileTile(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * .3, //255,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ClipPath(
              clipper: MyCustomClipperTop(),
              child: Container(
                width: MediaQuery.of(context).size.width, //200,
                height: 150, //MediaQuery.of(context).size.height*.5,//200,
                color: const Color(0xFF8A44EA),
                child: Row(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipPath(
              clipper: MyCustomClipperBottom(),
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width, //200,
                  height: 150, //MediaQuery.of(context).size.height*.5,//200,
                  color: const Color(0xFFFE4C64),
                  child: Row(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {

              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: (){
                final customScafoldKey =
                    Provider.of<CustomScafoldKey>(context, listen: false);
                customScafoldKey.scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("image/Dr.png"),
                        //radius: 50,
                        minRadius: 3,
                        maxRadius: 50,
                      ),
                      Positioned(
                          bottom:4,
                          right: 4,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Icon(
                              Icons.verified,
                              color: Color(0xffFFA45A),
                              //size: 30,
                            ),
                          ),
                          // Container(
                          //   height: 30,
                          //   width: 30,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     border: Border.all(
                          //       width: 4,
                          //       color: Colors.transparent,//const Color(0xffFFA45A),
                          //     ),
                          //     color: Colors.transparent,
                          //   ),
                          //   child: const Icon(
                          //     Icons.verified,
                          //     color: Color(0xffFFA45A),
                          //     size: 30,
                          //   ),
                          // ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Dr. Shahid Mahamum",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  //http://shahidmahmum.com/
                   Text(
                    "Doctor of Medicine(MD) & CEO of Excel IT AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width * .7,
      size.height * 0,
    );
    path.lineTo(size.width * .7, 0); //size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
    throw UnimplementedError();
    //return true;
  }
}

class MyCustomClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height / 7);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 10,
      size.width / 10,
      size.height,
    );
    path.lineTo(size.width / 7, size.height); //size.height);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
    throw UnimplementedError();
  }
}
