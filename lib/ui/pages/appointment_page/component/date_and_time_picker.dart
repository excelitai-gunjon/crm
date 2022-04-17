import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateAndTimePicker extends StatefulWidget {
  const CustomDateAndTimePicker({Key? key}) : super(key: key);

  @override
  _CustomDateAndTimePickerState createState() => _CustomDateAndTimePickerState();
}

class _CustomDateAndTimePickerState extends State<CustomDateAndTimePicker> {

  DateTime selectedDate = DateTime.now();
  String formattedDate =DateFormat('MMM y').format(DateTime.now());
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('MMM y').format(selectedDate);
        //formattedDate = DateFormat('kk:mm:ss \n EEE d MMM YYYY').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Text(formattedDate.toString()),
          const Icon(Icons.keyboard_arrow_down_outlined),
        ],
      ),
    );
  }
}
