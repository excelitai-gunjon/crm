import 'package:flutter/material.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/appointment_page2.dart';

class CustomAppointmentButton extends StatelessWidget {
  const CustomAppointmentButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(
                  const Color(0xff5B74DF)
              ),
              //fixedSize: MaterialStateProperty.all<Size>(Size.infinite),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30),
                      side: const BorderSide(
                          color: Color(0xff5B74DF),
                      )
                  )
              )
          ),
          onPressed: (){
            //avigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage2()));
          },
          child: const Text("Book Appointment"),
        ),
      ),
    );
  }
}
