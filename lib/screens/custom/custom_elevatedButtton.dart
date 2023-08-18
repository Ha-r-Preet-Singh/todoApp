import 'package:flutter/material.dart';




class CustomElevatedButtton extends StatefulWidget {

  Color bgColor;
  String title;
  double fSize;
  FontWeight fWeight;
  String? fFamily;
  Color fColor;
  Function() onTap;
 CustomElevatedButtton({
    required this.bgColor,
   required this.title,
   required this.fSize,
   required this.fWeight,
   this.fFamily,
   required this.fColor,
   required this.onTap
});

  @override
  State<CustomElevatedButtton> createState() => _CustomElevatedButttonState();
}

class _CustomElevatedButttonState extends State<CustomElevatedButtton> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height*.06,
      width: media.size.width*.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgColor,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

          ),


        ),
          onPressed: widget.onTap, child:Text(widget.title,style: TextStyle(
          fontSize: widget.fSize,
          fontWeight: widget.fWeight,
          fontFamily: widget.fFamily,
          color: widget.fColor
      ),)),
    );
  }
}
