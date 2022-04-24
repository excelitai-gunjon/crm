import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenderDropDownButtonWidget extends StatefulWidget{
  const CustomGenderDropDownButtonWidget({Key? key}) : super(key: key);

  @override
  _CustomGenderDropDownButtonWidgetState createState() => _CustomGenderDropDownButtonWidgetState();
}

class _CustomGenderDropDownButtonWidgetState extends State<CustomGenderDropDownButtonWidget> {

  String dropdownvalue = 'male';
  var items=[
    "male",
    "female",
    "Other",
  ];
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("Gender"),
        Container(
          height: 40,
          width: ScreenUtil().screenWidth*.5,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              // hint: Text(
              //   'Select Item',
              //   style: TextStyle(
              //     fontSize: 14,
              //     color: Theme.of(context).hintColor,
              //   ),
              // ),
              items: items
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
              value: dropdownvalue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
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
