import 'package:flutter/material.dart';

class CustomClipPaths extends StatefulWidget{
  const CustomClipPaths({Key? key}) : super(key: key);
  @override
  _CustomClipPathsState createState() => _CustomClipPathsState();
}
class _CustomClipPathsState extends State<CustomClipPaths> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: Center(
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // This variable define for better understanding you can direct specify value in quadraticBezierTo method
    var controlPoint = Offset(size.width / 2, size.height / 2);
    var endPoint = Offset(size.width, size.height);

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper){
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class CustomClipPathClass extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0,h);
    path.lineTo(w,h);
    path.lineTo(w,0);
    path.close();
    path.lineTo(0, h);
    // path.quadraticBezierTo(
    //   w * 0.5,
    //   h - 100,
    //   w,
    //   h,
    // );

    //final path
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
