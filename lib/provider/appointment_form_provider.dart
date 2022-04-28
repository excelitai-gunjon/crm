import 'package:flutter/material.dart';

class AppointmentForm with ChangeNotifier{

  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  // TextEditingController? nameController;
  // TextEditingController? nameController;

  initialPage(){
    nameController= TextEditingController();
    notifyListeners();
  }

}