import 'package:flutter/material.dart';

class CustomClipperBackgroundBottom extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height / 7);
    //path.lineTo(0, size.height*.4); //start path with this if you are making at bottom
    var firstStart = Offset(size.width*.1, size.height*.1-50);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width-(size.width/2),size.height);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    // path.quadraticBezierTo(
    //   size.width / 2,
    //   size.height / 100,
    //   size.width / 100,
    //   size.height,
    // );
    //path.lineTo(size.width / 7, size.height); //size.height);
    return path;
    return path;

    // TODO: implement getClip
    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
