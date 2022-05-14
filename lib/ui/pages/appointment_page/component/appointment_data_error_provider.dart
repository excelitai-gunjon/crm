import 'package:flutter/material.dart';

class AppointmentErrorData with ChangeNotifier{
  bool selectTime=false;
  bool selectGender=false;
  void setSelectTime(){
    selectTime=true;
    notifyListeners();
  }

  void setSelectGender(){
    selectGender=true;
  }
}