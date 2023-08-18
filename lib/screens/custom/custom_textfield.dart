import 'package:flutter/material.dart';
import 'package:note_bloc_app/ui_helper.dart';

class CustomTextfield extends StatefulWidget {
  String hintTxt;
  Color fColor;
  TextEditingController? TextFieldController;
 String? Function(String?) validate;

  CustomTextfield({
    required this.hintTxt,
    required this.fColor,
     required this.validate,
  this.TextFieldController,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height*.07,
      width: media.size.width*.9,
      child: TextFormField(
        controller: widget.TextFieldController,
        cursorColor:AppColors.PinkColor,
        style: TextStyle(
          color: AppColors.WhiteColor,
          fontWeight: FontWeight.w900,
          fontFamily: "montbold"
        ),

        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fColor,
            hintText: widget.hintTxt,



            hintStyle: TextStyle(color: Colors.grey, fontFamily: "mont"),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.PinkColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        validator: widget.validate,

      ),
    );
  }
}
