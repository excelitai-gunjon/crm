import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownDateOfBirthWidget extends StatefulWidget{
  const CustomDropDownDateOfBirthWidget({Key? key}) : super(key: key);
  @override
  _CustomDropDownDateOfBirthWidgetState createState() => _CustomDropDownDateOfBirthWidgetState();
}
class _CustomDropDownDateOfBirthWidgetState extends State<CustomDropDownDateOfBirthWidget>{

  String dropdownvalue = 'male';

  var items=[
    "male",
    "female",
    "Other",
  ];

  int dropdownDate=1;
  var dateList=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,31,];

  String dropdownMonth="Select Month";
  var monthList=[
    'Select Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String dropdownYear="Select Year";
  var yearList=[
    'Select Year',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '20010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2019',
    '2020',
    '2021',
    '2022',
  ];

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: ScreenUtil().screenWidth*.3,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownMaxHeight: 200,
              hint: Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: dateList
                  .map((item) => DropdownMenuItem<int>(
                value: item,
                child: Text(
                  item.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
              ).toList(),
              value: dropdownDate,
              onChanged: (int? newValue) {
                setState(() {
                  dropdownDate = newValue!;
                });
              },
              buttonHeight: 40,
              buttonWidth: 140,
              itemHeight: 40,
            ),
          ),
        ),
        Container(
          height: 40,
          width: ScreenUtil().screenWidth*.3,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownMaxHeight: 200,
              hint: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: monthList
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                  ),
                ),
              )
              ).toList(),
              value: dropdownMonth,
              onChanged: (String? newValue){
                setState((){
                  dropdownMonth = newValue!;
                });
              },
              buttonHeight: 40,
              buttonWidth: 140,
              itemHeight: 40,
            ),
          ),
        ),
        Container(
          height: 40,
          width: ScreenUtil().screenWidth*.3,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              dropdownMaxHeight: 200,
              hint: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: yearList
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                  ),
                ),
              )
              ).toList(),
              value: dropdownYear,
              onChanged: (String? newValue){
                setState((){
                  dropdownYear = newValue!;
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
