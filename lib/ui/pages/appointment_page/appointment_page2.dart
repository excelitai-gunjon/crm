import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/example/expandable_text.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/custom_drop_down_button.dart';
import 'package:shahid_mahamum_sir/ui/pages/appointment_page/component/horizontal_date_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../example/custom_drop_down_button.dart';
import '../../../provider/attached_file_provider.dart';
import '../payment_getway_oage/pay_later_page.dart';
import '../payment_getway_oage/payment_page1.dart';
import 'component/appointment_data_error_provider.dart';
import 'component/custom_appointment_button.dart';
import 'component/custom_drop_down_date_of_birth_widget.dart';
import 'component/custom_text_form_field.dart';
import 'component/file_page.dart';

enum Attached{
  gallery,
  camera,
  fileAttached,
}

class AppointmentPage2 extends StatefulWidget{
  const AppointmentPage2({Key? key}) : super(key: key);
  @override
  _AppointmentPage2State createState() => _AppointmentPage2State();
}

class _AppointmentPage2State extends State<AppointmentPage2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController purposeOfAppointmentController = TextEditingController();
  // TextEditingController nameController=TextEditingController();
  // TextEditingController nameController=TextEditingController();
  bool selectTime=true;
  bool selectGender=true;
  bool nameError = false;
  bool emailError = false;
  bool phoneNumberError = false;
  bool purposeOfAppointmentError = false;
  //bool nameError=false;

  final formkey = GlobalKey<FormState>();
  late PlatformFile files;
  Attached? _attached;
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
  bool selected = false;
  String? _selectItem;// ];
  String? _selectAppointmentItem;// ];
  String? _errorTextGender="Select Gender";
  String? _errorTextAppointment="Select Appointment";

  @override
  Widget build(BuildContext context) {
    final attachedFile = Provider.of<AttachedFile>(context);
    final size = MediaQuery.of(context).size;
    final appointmentErrorData=Provider.of<AppointmentErrorData>(context);

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
            child: Form(
              key: formkey,
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
                        height: ScreenUtil().screenWidth / 2, //size.width / 2,
                        width: ScreenUtil().screenWidth,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                height: ScreenUtil().screenHeight,
                                width: ScreenUtil().screenWidth / 2,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height:
                                            ScreenUtil().screenWidth / 2 - 50,
                                        width: ScreenUtil().screenWidth,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                        height: ScreenUtil().screenHeight,
                                        width: ScreenUtil().screenWidth,
                                        child: Image.asset(
                                          "image/IMG_3745-Background Remove.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        onTap: (){
                          //_selectDate(context);
                        },
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
                      appointmentErrorData.selectTime==false?
                      Center(
                        child: Text(
                          "Please Select Time *",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ):Container(),
                      const SizedBox(
                        height: 20,
                      ),
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
                      TextFormField(
                        controller: nameController,
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
                            errorText: nameError ?"enter your name" : '',
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        nameError ? Colors.red : Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff0984e3)), //Colors.amber),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter Your Name",
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF909090)
                            )),
                      ),
                      ///
                      Text("Gender",style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: ScreenUtil().screenWidth,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: [
                              "male",
                              "female",
                              "Other",
                            ].map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            )
                            ).toList(),
                            hint: Text(_errorTextGender!,
                              style: _errorTextGender=="Please Select Gender"?TextStyle(color: Colors.red):TextStyle(color: Colors.black),),
                            value: _selectItem,//widget.dropdownvalue,
                            onChanged: (String? newValue){
                              setState((){
                                _selectItem=newValue!;
                                print(_selectItem!+"<<<<<<<<<<<<>>>>>>>>>>>>>>>");
                              });
                            },
                            // buttonHeight: 40,
                            // buttonWidth: 140,
                            //itemHeight: 40,
                          ),
                        ),
                      ),
                      ///
                      const SizedBox(
                        height: 20,
                      ),
                      ///
                      ///
                      Text("Appointment Type",style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize:
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: ScreenUtil().screenWidth,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: [
                              "On Line",
                              "Off Line",
                            ].map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            )
                            ).toList(),
                            hint: Text(_errorTextAppointment!,
                              style: _errorTextAppointment=="Please Select Appointment Type"?TextStyle(color: Colors.red):TextStyle(color: Colors.black),),
                            value: _selectAppointmentItem,//widget.dropdownvalue,
                            onChanged: (String? newValue){
                              setState((){
                                _selectAppointmentItem=newValue!;
                                print(_selectAppointmentItem!+"<<<<<<<<<<<<>>>>>>>>>>>>>>>");
                              });
                            },
                            // buttonHeight: 40,
                            // buttonWidth: 140,
                            //itemHeight: 40,
                          ),
                        ),
                      ),
                      ///
                      ///
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
                      TextFormField(
                        controller: emailController,
                        cursorColor: Colors.grey,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
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
                            errorText: emailError ? "Enter Your Email" : "",
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: emailError ? Colors.red : Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff0984e3)), //Colors.amber),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: "Enter Your Email ",
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF909090))),
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
                      TextFormField(
                        controller: phoneNumberController,
                        cursorColor: Colors.grey,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
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
                            errorText: phoneNumberError
                                ? "Enter Your Phone Number"
                                : "",
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: phoneNumberError
                                        ? Colors.red
                                        : Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff0984e3)), //Colors.amber),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter Your Phone Number",
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF909090))),
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
                          controller: purposeOfAppointmentController,
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
                                  color: Colors.black87, fontSize: 18,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                              ),
                              errorText: purposeOfAppointmentError
                                  ? "Please enter purpose of appointment"
                                  : "",
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: purposeOfAppointmentError
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color(0xff0984e3)), //Colors.amber),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Write here...",
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Color(0xFF909090)
                              ))
                      ),
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
                              height: ScreenUtil().screenWidth / 2 + 50,
                              width: ScreenUtil().screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xff0984e3),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Scaffold(
                                  body: buildWrap(attachedFile),
                                  floatingActionButton: SpeedDial(
                                    backgroundColor: Colors.deepPurple,
                                    animatedIcon: AnimatedIcons.add_event,
                                    onOpen: () {
                                      setState(() {});
                                    },
                                    children: [
                                      SpeedDialChild(
                                        backgroundColor:
                                            const Color(0xffAE91D5),
                                        child: const Icon(Icons.photo),
                                        label: "Gallery",
                                        onTap: () {
                                          _attached = Attached.gallery;
                                          attachedFile.pickImageFromGallery();
                                        },
                                      ),
                                      SpeedDialChild(
                                        backgroundColor:
                                            const Color(0xffAE91D5),
                                        child: const Icon(Icons.camera_alt),
                                        label: "Camera",
                                        onTap: () {
                                          _attached = Attached.camera;
                                          attachedFile.pickImageFromCamera();
                                        },
                                      ),
                                      SpeedDialChild(
                                        backgroundColor:
                                            const Color(0xffAE91D5),
                                        child: const Icon(
                                            Icons.attachment_outlined),
                                        label: "Attached File",
                                        onTap: () {
                                          _attached = Attached.fileAttached;
                                          attachedFile.addAttachedFile();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildCustomAppointmentButton(
          context,
          formkey,
        ),
      ),
    );
  }

  Widget buildCustomAppointmentButton(
      BuildContext context, GlobalKey<FormState> formKey) {
    final appointmentErrorData = Provider.of<AppointmentErrorData>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff5B74DF)),
              //fixedSize: MaterialStateProperty.all<Size>(Size.infinite),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xff5B74DF),
                      )))),
          onPressed: () {
            if (nameController.text.isNotEmpty &&
                emailController.text.isNotEmpty &&
                phoneNumberController.text.isNotEmpty &&
                appointmentErrorData.selectTime == true&&
                _selectItem!.isNotEmpty&&
                _selectAppointmentItem!.isNotEmpty) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  selectTime = true;
                  nameError = false;
                  emailError = false;
                  phoneNumberError = false;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Container(
                          height: ScreenUtil().setHeight(300),
                          width: ScreenUtil().setWidth(300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Color(0xffAE91D5),
                                    size: 30,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const PayLaterPage();
                                            });
                                      },
                                      child: Container(
                                        height: ScreenUtil().setHeight(100),
                                        width: ScreenUtil().setWidth(100),
                                        decoration: BoxDecoration(
                                            color: const Color(
                                                0xffAE91D5), //Color(0xffE7EDFD),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Pay',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        ScreenUtil().setSp(25),
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Later',
                                                      style: const TextStyle(
                                                          color: Colors.indigo,
                                                          fontSize: 18),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // navigate to desired screen
                                                            })
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Color(0xffAE91D5),
                                    // Color(0xffE7EDFD),
                                    GestureDetector(
                                      onTap: () {
                                        //Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const PayNowPage();
                                            });
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
                                      },
                                      child: Container(
                                        height: ScreenUtil().setHeight(100),
                                        width: ScreenUtil().setWidth(100),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAE91D5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Pay',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        ScreenUtil().setSp(25),
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Now',
                                                      style: const TextStyle(
                                                          color: Colors.indigo,
                                                          fontSize: 18),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              // navigate to desired screen
                                                            })
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              if (nameController.text.isEmpty) {
                setState(() {
                  nameError = true;
                });
              }
              if (emailController.text.isEmpty) {
                setState(() {
                  emailError = true;
                });
              }
              if(phoneNumberController.text.isEmpty){
                setState(() {
                  phoneNumberError = true;
                });
              }
              if(purposeOfAppointmentController.text.isEmpty){
                setState(() {
                  purposeOfAppointmentError = true;
                });
              }
              if(appointmentErrorData.selectTime==false){
                setState(() {
                  selectTime = false;
                });
              }//appointmentErrorData.selectGender
              if(_selectItem==null){
                setState(() {
                  _errorTextGender="Please Select Gender";
                });
              }
              if(_selectAppointmentItem==null){
                setState((){
                  _errorTextAppointment="Please Select Appointment Type";
                });
              }
            }//avigator.push(context, MaterialPageRoute(builder: (context)=>const AppointmentPage2()));;
          },
          child: const Text("Book Appointment"),
        ),
      ),
    );
  }
  Widget buildWrap(AttachedFile attachedFile){
    if (_attached == Attached.gallery) {
      return Wrap(
        direction: Axis.horizontal,
        children: AttachedFile.galleryList.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    OpenFile.open(e.path);
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setHeight(50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreen,
                        //shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.file(
                            File(e.path.toString()),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Positioned(
                          top: -10,
                          right: -10,
                          child: GestureDetector(
                            onTap: () {
                              attachedFile.removeGalleryFile(e);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.cancel_outlined),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Text('${e.name}'+'${e.extension}'),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setHeight(50),
                  child: Text(
                    '${e.absolute}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(7),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }
    if (_attached == Attached.fileAttached) {
      return Wrap(
        direction: Axis.horizontal,
        children: AttachedFile.attachedfiles.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    OpenFile.open(e.path.toString());
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setHeight(50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreen,
                        //shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.orangeAccent,
                        )),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.file(
                            File(e.path.toString()),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Positioned(
                          top: -10,
                          right: -10,
                          child: GestureDetector(
                            onTap: () {
                              attachedFile.removeAttachedFile(e);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.cancel_outlined),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Text('${e.name}'+'${e.extension}'),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setHeight(50),
                  child: Text(
                    '${e.name}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(7),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }
    return Wrap(
      direction: Axis.horizontal,
      children: AttachedFile.galleryList.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  OpenFile.open(e.path);
                },
                child: Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightGreen,
                      //shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.orangeAccent,
                      )),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.file(
                          File(e.path.toString()),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: GestureDetector(
                          onTap: () {
                            attachedFile.removeGalleryFile(e);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle),
                            child: const Icon(Icons.cancel_outlined),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //Text('${e.name}'+'${e.extension}'),
              SizedBox(
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setHeight(50),
                child: Text(
                  '${e.absolute}',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(7),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FilePage(
              files: files,
            )));
  }
}
