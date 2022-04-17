import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalProjectsPage extends StatelessWidget {
  const MedicalProjectsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: Cros,
            children: [
              Container(
                height: ScreenUtil().setHeight(450),
                width: ScreenUtil().screenWidth,
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "25 MAY 2020",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                      Text(
                        "LEUKEMIA, CAUSES, SIGNS AND SYMPTOMS VIDEO DIAGNOSIS AND TREATMENT",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Leukemias are classified as acute or chronic based on the degree of cellular differentiation and the predominant cell type present.",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(80),),
                      Container(
                        height: ScreenUtil().setHeight(3),
                        width: ScreenUtil().setWidth(70),
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(80),),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      width: ScreenUtil().setWidth(70),
                      color: Colors.redAccent,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    Text(
                      "LEUKEMIA PROJECT UPDATE",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "STARTED WITH THE MISSION OF CREATING SOMETHING FOR WORLD.",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    const Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                    Text(
                      "What is Leukemia?\nLeukemia is the result of the rapid overproduction of abnormal white blood cells. It affects close to 45,000 people in the United States each year.\nLeukemia is the most common type of blood cancer in people older than 55. But, it’s also the most common cancer in children under 15.\nWhat Causes Leukemia?\nLeukemia occurs when abnormal white blood cells in the bone marrow quickly increase and destroy normal blood cells. This leaves a person prone to infection.\nTreatment approaches for leukemia depend on the type of white blood cell affected and whether the disease is acute or chronic.\nAcute leukemia forms rapidly and becomes severe quickly. Chronic leukemia grows more slowly and takes longer to advance.\nTypes of Leukemia\nThe four most common types of leukemia are:",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
