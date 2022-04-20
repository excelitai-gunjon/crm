import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  const CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      // obscureText: widget.obscureText,
      // controller: widget.controller,
      cursorColor: Colors.grey,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      //widget.textInputType,

      // onChanged: (value){
      //     //widget.controller.text==widget.checkMatchPassword;
      //
      //   if(widget.textInputType == TextInputType.visiblePassword){
      //     String password = widget.checkMatchPassword.toString();
      //     String confirmPassword = value.toString();
      //     print(password+"    "+confirmPassword);
      //
      //     if(password.startsWith(confirmPassword)){
      //
      //         _errorText="matched";
      //
      //         print(_errorText);
      //
      //
      //     }
      //     else{
      //       _errorText="Don't Match";
      //       print(_errorText);
      //     }
      //   }



      //},

      // validator: (value) {
      //   if(widget.textInputType==TextInputType.emailAddress){
      //     if(value!=null && !EmailValidator.validate(value)){
      //       return 'Enter a Valid Email Address';
      //     }
      //     return null;
      //   }
      //   if(widget.textInputType==TextInputType.text){
      //     String name = value.toString();
      //     if(name.isEmpty){
      //       return 'Enter Your name';
      //     }
      //     return null;
      //   }
      //   if(widget.textInputType == TextInputType.visiblePassword){
      //
      //     String password = value.toString();
      //     //print(password+"     "+widget.checkMatchPassword.toString());
      //     if(password.isEmpty){
      //       return 'Enter Your password';}
      //     else if(password!=widget.checkMatchPassword.toString()){
      //       return "Password Doesn't Match";
      //     }
      //     return null;
      //
      //
      //
      //   }
      // },
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignLabelWithHint: true,
          labelText: "",//widget.labelText,
          //errorText: widget.errorText,
          labelStyle: const TextStyle(color: Colors.black87, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(25)),
          hintText: "",
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
