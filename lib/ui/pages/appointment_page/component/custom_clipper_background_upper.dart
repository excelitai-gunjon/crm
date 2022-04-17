import 'package:flutter/material.dart';

class CustomClipperBackgroundUpper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height*.4); //start path with this if you are making at bottom
    var firstStart = Offset(size.width*.1, size.height*.6);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width-(size.width/3),size.height*.7);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width-(size.width/3), size.height*.4);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height*.65);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();

    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
