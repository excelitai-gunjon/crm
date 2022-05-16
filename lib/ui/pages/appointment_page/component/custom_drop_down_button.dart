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
  String? _selectItem;// ];
  String? _errorText;// ];

  @override
  void initState() {
    // TODO: implement initState
    if(widget.title=="Gender"){
      _errorText="Select Gender";
    }
    if(widget.title=="Appointment Type"){
      _errorText="Select Appointment Type";
    }
  }


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
            child: DropdownButton(
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
              ).toList(),
              hint: Text(_errorText!,
                style: _errorText=="Please Select ${widget.title}"?TextStyle(color: Colors.red):TextStyle(color: Colors.black),),
              value: _selectItem,//widget.dropdownvalue,
              onChanged: (String? newValue){
                setState((){
                  _selectItem=newValue!;
                  print(widget.dropdownvalue+"<<<<<<<<<<<<>>>>>>>>>>>>>>>");
                });
              },
              // buttonHeight: 40,
              // buttonWidth: 140,
              //itemHeight: 40,
            ),
          ),
        ),
      ],
    );
  }
}
