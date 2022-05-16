import 'package:flutter/material.dart';

class AppointmentErrorData with ChangeNotifier{
  bool selectTime=false;
  bool selectGender=true;
  void setSelectTime(){
    selectTime=true;
    notifyListeners();
  }

  void setSelectGender(bool _bool){
    selectGender=_bool;
    notifyListeners();
  }//
}