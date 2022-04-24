import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:shahid_mahamum_sir/example/expandable_text.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/custom_drop_down_button.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/horizontal_date_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../example/custom_drop_down_button.dart';
import 'component/custom_appointment_button.dart';
import 'component/custom_drop_down_date_of_birth_widget.dart';
import 'component/custom_text_form_field.dart';
import 'component/file_page.dart';

class AppointmentPage2 extends StatefulWidget {
  const AppointmentPage2({Key? key}) : super(key: key);
  @override
  _AppointmentPage2State createState() => _AppointmentPage2State();
}

class _AppointmentPage2State extends State<AppointmentPage2> {
  String dropdownvalue = 'Apple';
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('MMM y').format(DateTime.now());
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

  //final items = ['Male', 'Female', 'Others'];
  int groupValue = 0;
  int value1 = 1;
  int value2 = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffAE91D5),
            Color(0xffE7EDFD),
            Color(0xffE8E2F6),
            Color(0xffFEFEFE),
            Color(0xffE7EEFE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: [0, 0, 0, 0.6, 1],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      //color: Colors.amber,
                      height:
                          ScreenUtil().screenWidth / 2 + 50, //size.width / 2,
                      width: ScreenUtil().screenWidth,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              height: ScreenUtil().screenHeight,
                              width: ScreenUtil().screenWidth / 2,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: ScreenUtil().screenWidth / 2,
                                      width: ScreenUtil().screenWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.deepPurple,
                                            Colors.purpleAccent,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          //stops: [0, 0],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset("image/Doctor.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Dr.Shahid Mahamum",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(25),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            openWhatsApp();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                                color: Color(
                                                    0xff29AD00), //Color(0xff7390EE),
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.whatsapp_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                              color: Color(0xff7390EE),
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.mail_outline,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ExpandableText(
                      "Leukemia, also spelled leukaemia, is a group of blood cancers that usually begin in the bone marrow and result in high numbers of abnormal blood cells. These blood cells are not fully developed and are called blasts or leukemia cells.Symptoms may include bleeding and bruising, feeling tired, fever, and an increased risk of infections.These symptoms occur due to",
                      trimLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Row(
                        children: [
                          Text(
                            formattedDate.toString(),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const HorizontalDateView(),
                    // Container(
                    //   height: ScreenUtil().setHeight(70),
                    //   width: ScreenUtil().screenWidth,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: Border.all(
                    //       width: 2,
                    //       color: Colors.amber
                    //     )
                    //   ),
                    //   child: Column(
                    //     children: const [
                    //       Text("Full Name"),
                    //       CustomTextFormField(
                    //         title: "Enter Your Name",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextFormField(
                      title: "Enter Your Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomGenderDropDownButtonWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextFormField(
                      title: "Enter Your email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextFormField(
                      title: "Enter Your Phone Number",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "date of Birth",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomDropDownDateOfBirthWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "purpose of appointment ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        maxLines: 7,
                        cursorColor: Colors.grey,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            alignLabelWithHint: true,
                            labelText: '', //widget.title,//widget.labelText,
                            //errorText: widget.errorText,
                            labelStyle: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff0984e3)), //Colors.amber),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Write here...",
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF909090)))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Previous Medical Report : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontSize:
                          ),
                        ),
                        Radio<int>(
                          value: value1,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                        ),
                        const Text(
                          "Yes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontSize:
                          ),
                        ),
                        Radio<int>(
                          value: value2,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                        ),
                        const Text(
                          "No",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontSize:
                          ),
                        ),
                      ],
                    ),
                    groupValue == 1
                        ? Container(
                            height: ScreenUtil().screenWidth / 2,
                            width: ScreenUtil().screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff0984e3),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: ()async{
                                    final result=await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,allowedExtensions: ['pdf','mp4',]);
                                    if(result==null){
                                      return;
                                    }
                                    //List<File> files = result!.paths.map((path) => File(path!)).toList();
                                    //final file = result.files.first;
                                    //OpenFile.open(file.path);
                                    openFiles(result.files);
                                  },
                                  child: const Text("upload form device"),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 80,
                    ),
                    //purpose of appointment
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CustomAppointmentButton(),
      ),
    );
  }

  openWhatsApp() async {
    var whatsapp = "+8801611815656";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text= Good Morning Sir";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilePage(
      files: files,
      //onOpenedFile: openFiles,
      // file:files,
      // onOpenFile: openFiles,
    )));
  }
}
