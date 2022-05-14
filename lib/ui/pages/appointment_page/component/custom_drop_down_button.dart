import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'appointment_data_error_provider.dart';

class CustomGenderDropDownButtonWidget extends StatefulWidget{
  CustomGenderDropDownButtonWidget({Key? key,required this.title,required this.dropdownvalue,required this.items}) : super(key: key);

  String title;
  String dropdownvalue;
  List<String> items;

  @override
  _CustomGenderDropDownButtonWidgetState createState() => _CustomGenderDropDownButtonWidgetState();
}

class _CustomGenderDropDownButtonWidgetState extends State<CustomGenderDropDownButtonWidget> {

  // String dropdownvalue = 'male';
  // var items=[
  //   "male",
  //   "female",
  //   "Other",
  // ];
  @override
  Widget build(BuildContext context){
    final appointmentErrorData =Provider.of<AppointmentErrorData>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.title,style: const TextStyle(
          fontWeight: FontWeight.bold,
          //fontSize:
        ),),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: ScreenUtil().screenWidth,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
              )
                  .toList(),
              value: widget.dropdownvalue,
              onChanged: (String? newValue) {
                setState((){
                  widget.dropdownvalue = newValue!;
                  if(widget.dropdownvalue=="male"||widget.dropdownvalue=="female"||widget.dropdownvalue=="Other"){
                    setState((){
                      appointmentErrorData.setSelectGender();
                    });
                  }
                });
              },
              buttonHeight: 40,
              buttonWidth: 140,
              itemHeight: 40,
            ),
          ),
        ),
      ],
    );
  }
}
