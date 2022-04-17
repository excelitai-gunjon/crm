import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  CustomTag({Key? key,this.tag}) : super(key: key);
  String? tag;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffedeceb),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(tag!.toString(),style: const TextStyle(
            color: Colors.black,
          ),),
        ),
      ),
    );
  }
}
