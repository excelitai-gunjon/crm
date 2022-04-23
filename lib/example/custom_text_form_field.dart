import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
    required this.onPressed,
    required this.textInputType,
    required this.obscureText,
    required this.changeTextVisibility,
    this.checkMatchPassword
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final VoidCallback changeTextVisibility;
  final TextInputType textInputType;
  bool obscureText;
  String? checkMatchPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState(){
    super.initState();
    widget.controller.addListener(onListen);
  }
  @override
  void dispose(){
    widget.controller.removeListener(onListen);
    super.dispose();
  }
  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 20,),
        TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.next,
          keyboardType: widget.textInputType,

          decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignLabelWithHint: true,
              labelText: "dsfg",//widget.labelText,
              //errorText: widget.errorText,
              labelStyle: const TextStyle(color: Colors.black87, fontSize: 18),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.circular(10)),
              hintText: widget.hintText,
              suffixIcon: IconButton(
                  color: Colors.grey,
                  icon: Icon(
                    widget.suffixIcon,
                  ),
                  onPressed: (){

                  },//widget.changeTextVisibility,
              ),
              hintStyle:
              const TextStyle(fontSize: 14, color: Color(0xFF909090))
          ),
        ),
      ],
    );
  }
}