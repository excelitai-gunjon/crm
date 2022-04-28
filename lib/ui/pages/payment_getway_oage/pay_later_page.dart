import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayLaterPage extends StatefulWidget {
  const PayLaterPage({Key? key}) : super(key: key);

  @override
  State<PayLaterPage> createState() => _PayLaterPageState();
}

class _PayLaterPageState extends State<PayLaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: ScreenUtil().setHeight(320),
          width: ScreenUtil().setWidth(300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel,color: Colors.grey,),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Pay',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(25),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Later',
                                  style: const TextStyle(
                                      color: Colors.indigo, fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    })
                            ]),
                      ),
                    ),
                    const Text("Appointment Completed"),
                    const Text("Thank You"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
