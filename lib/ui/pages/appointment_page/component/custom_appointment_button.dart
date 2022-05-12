import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/appointment_page2.dart';
import 'package:shahid_mahamum_sir/ui/pages/payment_getway_oage/pay_later_page.dart';
import 'package:shahid_mahamum_sir/ui/pages/payment_getway_oage/payment_page1.dart';

class CustomAppointmentButton extends StatefulWidget {
  CustomAppointmentButton({Key? key,required this.formKey}) : super(key: key);

  GlobalKey<FormState> formKey;

  @override
  State<CustomAppointmentButton> createState() => _CustomAppointmentButtonState();
}

class _CustomAppointmentButtonState extends State<CustomAppointmentButton> {

  bool payNow=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff5B74DF)),
              //fixedSize: MaterialStateProperty.all<Size>(Size.infinite),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xff5B74DF),
                      )
                  )
              )
          ),
          onPressed: () {
            if(widget.formKey.currentState!.validate()){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Container(
                        height: ScreenUtil().setHeight(300),
                        width: ScreenUtil().setWidth(300),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color(0xffAE91D5),
                                  size: 30,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      showDialog(context: context, builder: (BuildContext context){
                                        return const PayLaterPage();
                                      });
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(100),
                                      width: ScreenUtil().setWidth(100),
                                      decoration: BoxDecoration(
                                          color: const Color(
                                              0xffAE91D5), //Color(0xffE7EDFD),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                              text: 'Pay',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(text: 'Later',
                                                    style: const TextStyle(
                                                        color: Colors.indigo, fontSize: 18),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Color(0xffAE91D5),
                                  // Color(0xffE7EDFD),
                                  GestureDetector(
                                    onTap: (){
                                      //Navigator.pop(context);
                                      showDialog(context: context, builder: (BuildContext context){
                                        return const PayNowPage();
                                      });
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(100),
                                      width: ScreenUtil().setWidth(100),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffAE91D5),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                              text: 'Pay',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(text: 'Now',
                                                    style: const TextStyle(
                                                        color: Colors.indigo, fontSize: 18),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            //avigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage2()));;
          },
          child: const Text("Book Appointment"),
        ),
      ),
    );
  }
}
