import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget{
  const CustomTextFormField({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context){
    return TextFormField(
      cursorColor: Colors.grey,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignLabelWithHint: true,
          labelText: '',//widget.title,//widget.labelText,
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
              borderSide: const BorderSide(color: Color(0xff0984e3)),//Colors.amber),
              borderRadius: BorderRadius.circular(10)),
          hintText: widget.title,
          // suffixIcon: IconButton(
          //   color: Colors.grey,
          //   icon: const Icon(
          //     Icons.perm_identity,
          //   ),
          //   onPressed: (){
          //   },//widget.changeTextVisibility,
          // ),
          hintStyle:
          const TextStyle(fontSize: 14, color: Color(0xFF909090))
      ),
    );
  }
}
