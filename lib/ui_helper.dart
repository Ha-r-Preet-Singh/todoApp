import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static final Color blackColor = Color(0xff191929);
  static final Color GreyColor = Color(0xff171717);
  static final Color WhiteColor = Color(0xffffffff);
  static final Color PinkColor = Color(0xffd027a4);
}

Widget hSpacer({mHeight = 10.0}) {
  return SizedBox(
    height: mHeight,
  );
}


Widget wSpacer({mWeight = 10.0}) {
  return SizedBox(
    width: mWeight,
  );
}

