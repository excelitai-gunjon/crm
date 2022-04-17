import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ProjectsMenuModel{
  String? name;
  String? title;
  String? departmentName;
  int? taskDone;
  int? totalTask;
  Color? color;
  IconData? icons;
  double? progress;

  ProjectsMenuModel({
    this.name,
    this.icons,
    this.title,
    this.departmentName,
    this.color,
    this.taskDone,
    this.totalTask,
    this.progress,
});

  static List<ProjectsMenuModel> list = [
    ProjectsMenuModel(
      icons: Icons.people,
      title: "Total Projects",
      departmentName: "Project Overview",
      taskDone: 1,
      totalTask: 2,
      color: const Color(0xff4cbefe),
      progress: 0.64,
    ),
    ProjectsMenuModel(
      icons: Icons.people,
      title: "Completed",
      departmentName: "Completed Projects",
      taskDone: 1,
      totalTask: 2,
      color: const Color(0xffFF79CE),
      progress: 0.64,
    ),
    ProjectsMenuModel(
      icons: Icons.people,
      title: "Emails",
      departmentName: "Project Mails",
      taskDone: 1,
      totalTask: 2,
      color: const Color(0xffFFBE18),
      progress: 0.64,
    ),
    ProjectsMenuModel(
      icons: Icons.people,
      title: "New Projects",
      departmentName: "All Projects",
      taskDone: 1,
      totalTask: 2,
      color: const Color(0xff8786FB),
      progress: 0.64,
    ),
  ];
}
