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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.4, //255,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurple,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: SafeArea(
                        child: Container(
                          width: MediaQuery.of(context).size.width, //200,
                          height:
                              150, //MediaQuery.of(context).size.height*.5,//200,
                          color: Color(0xFF8A44EA),
                          child: Row(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width/2,
      size.height,
      size.width * .7,
      size.height*0,
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
