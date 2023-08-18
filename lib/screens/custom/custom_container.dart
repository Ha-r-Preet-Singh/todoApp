import 'package:flutter/material.dart';
import 'package:note_bloc_app/ui_helper.dart';





class CustomContainer extends StatelessWidget {


  double mHeight;
  double mWidth;
  Color cColor;
  BorderRadius cRadius;
  Color BorderColor;
  IconData? cIcon;


  CustomContainer({
    required this.mHeight,
    required this.mWidth,
    required this.cColor,
  required this.cRadius,
    required this.BorderColor,
    this.cIcon,

});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      width: mWidth,
      decoration: BoxDecoration(
        color: cColor,
        borderRadius: cRadius,
        border: Border.all(color:BorderColor )

      ),
      child: Icon(cIcon!,color: AppColors.WhiteColor,),

    );
  }
}
