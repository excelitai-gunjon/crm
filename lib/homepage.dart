import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .4, //255,
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
                          height:
                              150, //MediaQuery.of(context).size.height*.5,//200,
                          color: Color(0xFF8A44EA),
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
                            height:
                                150, //MediaQuery.of(context).size.height*.5,//200,
                            color: Color(0xFFFE4C64),
                            child: Row(),
                          ),
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
                        onPressed: () {},
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
    throw UnimplementedError();
  }
}

class MyCustomClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
    throw UnimplementedError();
  }
}
