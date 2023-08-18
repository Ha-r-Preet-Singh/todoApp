import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_bloc_app/constant/app_constants.dart';
import 'package:note_bloc_app/onboarding/login_screen.dart';
import 'package:note_bloc_app/onboarding/signup_screeen.dart';
import 'package:note_bloc_app/screens/custom/custom_text.dart';
import 'package:note_bloc_app/screens/home/home_screen.dart';
import 'package:note_bloc_app/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String LOGIN_KEY = "LoggedIN";
  var orientaion;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientaion==Orientation.portrait){
            return Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Column(

                children: [
                  Lottie.asset("assets/lottie/note.json"),
                  CustomText(title: AppConstants.app_name, fSize: 65, fWeight: FontWeight.bold,fFamily: "montbold" ,fColor: AppColors.WhiteColor)



                ],
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Lottie.asset("assets/lottie/note.json",height: 150,width: 150),
                    CustomText(title: AppConstants.app_name, fSize: 55, fWeight: FontWeight.bold,fFamily: "montbold" ,fColor: AppColors.WhiteColor)



                  ],
                ),
              ),
            );

          }
        },
      ),
    );
  }
  void whereToGo()async{
var prefs = await SharedPreferences.getInstance();


var isLogin = prefs.getBool(LOGIN_KEY);
Timer(Duration(seconds: 2), ()async {

  if(isLogin != null){
    if(isLogin){
      //when true
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  }else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
  }

});



  }
}
