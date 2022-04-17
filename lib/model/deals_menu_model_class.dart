import 'package:flutter/material.dart';

class DealsMenuModel{
  String? name;
  String? title;
  String? departmentName;
  int? taskDone;
  int? totalTask;
  Color? color;
  IconData? icons;
  double? progress;
  //var icon;
  DealsMenuModel({
    this.name,
    this.icons,
    this.title,
    this.departmentName,
    this.color,
    this.taskDone,
    this.totalTask,
    this.progress,
  });

  static List<DealsMenuModel> list = [
    DealsMenuModel(
      icons: Icons.medical_services_outlined,//Icons.nature_people_outlined,
      title: "Doctor",
      departmentName: "HR Departments",
      taskDone: 1,
      totalTask: 2,
      color: const Color(0xffFE4C64),
      progress: 0.64,
    ),
    DealsMenuModel(
      icons: Icons.nature_people_outlined,
      title: "Entrepreneur",
      departmentName: "Deals",
      taskDone: 20,
      totalTask: 20,
      color: const Color(0xff15D020),
      progress: 0.48,
    ),
    DealsMenuModel(
      icons: Icons.medical_services_sharp,
      title: "CEO of Excel IT AI",
      departmentName: "Deals",
      taskDone: 0,
      totalTask: 1,
      color: const Color(0xffFFBE18),
      progress: 0.84,
    ),
    DealsMenuModel(
      icons: Icons.label,
      title: "MD",
      departmentName: "HR Departments",
      taskDone: 9,
      totalTask: 10,
      color: const Color(0xff0365FF),
      progress: 0.47,
    ),
  ];
}
