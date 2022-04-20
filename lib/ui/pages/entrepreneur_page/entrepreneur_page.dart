import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntrepreneurPage extends StatelessWidget {
  const EntrepreneurPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().scaleHeight,
      width: ScreenUtil().scaleWidth,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ScreenUtil().setHeight(400),
                width: ScreenUtil().setWidth(360),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_9193-1536x1152.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 30),
                        child: Text(
                          "S C R O L L     D O W N",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: Text(
                          "ENTREPRENEUR\nON\nDIGITAL\nPLATFORM",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      width: ScreenUtil().setWidth(70),
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "ENTREPRENEUR ON\nDIGITAL PLATFORM",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "I’M A GREAT BELIEVER IN WORK AND THE MORE RESULTS I GET THE MORE RESULTS I GET TO WORK.",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Digital Marketing Trainer",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "I train through in assorted Aspects of Digital Marketing like Search Engine Optimization (SEO), Social Media Marketing (SMM), Google Analytics, Google Adwords, Email Marketing, Digital Strategy & Media planning & various related entities.",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().screenWidth,
                      //color: Colors.amberAccent,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_5900-300x225.jpg"),
                        )
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().screenWidth,
                      //color: Colors.amberAccent,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_6087-300x225.jpg"),
                          )
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().screenWidth,
                      //color: Colors.amberAccent,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_9193-1536x1152.jpeg"),
                          )
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().screenWidth,
                      //color: Colors.amberAccent,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_8769-1536x1152.jpeg"),
                          )
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().screenWidth,
                      //color: Colors.amberAccent,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://www.shahidmahmum.com/wp-content/uploads/2020/11/IMG_9198-768x768.jpeg"),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Stop blaming me for the problem. If you think I’m your problem, change me. If you realize that you are the problem, change yourself, learn something and gain knowledge. Most people want to change everyone except themselves. if you want to win then needed change from yourself”Just Believe Yourself & Do hard Work. Once the [YOU] race is strong, it’s no longer Lose you like me.",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
