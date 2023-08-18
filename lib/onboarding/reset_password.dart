import 'package:flutter/material.dart';
import 'package:note_bloc_app/database_provider/app_database.dart';
import 'package:note_bloc_app/onboarding/login_screen.dart';

import '../screens/custom/custom_container.dart';
import '../screens/custom/custom_elevatedButtton.dart';
import '../screens/custom/custom_text.dart';
import '../screens/custom/custom_textfield.dart';
import '../ui_helper.dart';




class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var orientaion;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
                  child: Form(
                    key: portraitKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,




                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: CustomContainer(
                                    mHeight: 55,
                                    mWidth: 55,
                                    cColor: Colors.white10,
                                    cRadius: BorderRadius.circular(20),
                                    BorderColor: AppColors.PinkColor,
                                    cIcon: Icons.arrow_back_ios_new,
                                  ),
                                ),
                                wSpacer(mWeight: 18.0),
                                CustomText(
                                  title: "Reset Password",
                                  fSize: 30,
                                  fWeight: FontWeight.bold,
                                  fColor: Colors.white,
                                  fFamily: "montbold",
                                ),
                              ],
                            ),
                            hSpacer(mHeight: 50.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Enter your New-Passwords here",
                                  fSize: 15,
                                  fWeight: FontWeight.w900,
                                  fColor: Colors.grey.shade400,
                                  fFamily: "mont",
                                ),
                                hSpacer(mHeight: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      title: "Password",
                                      fSize: 18,
                                      fWeight: FontWeight.bold,
                                      fColor: Colors.white,
                                      fFamily: "montbold",
                                    ),
                                    hSpacer(),
                                    CustomTextfield(
                                      hintTxt: "Pick a New Password",
                                      fColor: Colors.white10,
                                      validate: (value){
                                        if (value == "" || value!.length < 5){
                                          return "Please enter valid Password(length must be 6 characters)!";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            hSpacer(mHeight: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Confirm Password",
                                  fSize: 18,
                                  fWeight: FontWeight.bold,
                                  fColor: Colors.white,
                                  fFamily: "montbold",
                                ),
                                hSpacer(),
                                CustomTextfield(
                                  hintTxt: "Confirm New password",
                                  fColor: Colors.white10,
                                  validate: (value){
                                    if (value == "" || value!.length < 5){
                                      return "Please enter valid Password(length must be 6 characters)!";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),


                          ],
                        ),
                        hSpacer(mHeight: 40.0),
                        CustomElevatedButtton(
                            onTap: ()async{
                              //if and if user is Authenticated
                              if(portraitKey.currentState!.validate()){
                                var check =
                                    await Appdatabase().resetPassword(passwordController.text, widget.email);
                                if(check){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                                }
                              }



                            },
                            bgColor: AppColors.PinkColor,
                            title: "Continue",
                            fSize: 20,
                            fWeight: FontWeight.w700,
                            fColor: AppColors.WhiteColor),







                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 30,bottom: 40),
                child: Form(
                  key: landscapeKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,




                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: CustomContainer(
                                  mHeight: 55,
                                  mWidth: 55,
                                  cColor: Colors.white10,
                                  cRadius: BorderRadius.circular(20),
                                  BorderColor: AppColors.PinkColor,
                                  cIcon: Icons.arrow_back_ios_new,
                                ),
                              ),
                              wSpacer(mWeight: 18.0),
                              CustomText(
                                title: "Reset Password",
                                fSize: 30,
                                fWeight: FontWeight.bold,
                                fColor: Colors.white,
                                fFamily: "montbold",
                              ),
                            ],
                          ),
                          hSpacer(mHeight: 50.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: "Enter your New-Passwords here",
                                fSize: 15,
                                fWeight: FontWeight.w900,
                                fColor: Colors.grey.shade400,
                                fFamily: "mont",
                              ),
                              hSpacer(mHeight: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        title: "Email",
                                        fSize: 18,
                                        fWeight: FontWeight.bold,
                                        fColor: Colors.white,
                                        fFamily: "montbold",
                                      ),
                                      hSpacer(),
                                      SizedBox(
                                          height: media.size.height * .15,
                                          width: media.size.width * .43,
                                          child: CustomTextfield(
                                            hintTxt: "xyz@gmail.com",
                                            fColor: Colors.white10,
                                            validate: (value){
                                              if (value == "" || !value!.contains("@")){
                                                return "Please enter valid email!";
                                              }
                                              return null;
                                            },
                                          )),
                                    ],
                                  ),
                                  wSpacer(
                                    mWeight: 30.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        title: "Password",
                                        fSize: 18,
                                        fWeight: FontWeight.bold,
                                        fColor: Colors.white,
                                        fFamily: "montbold",
                                      ),
                                      hSpacer(),
                                      SizedBox(
                                          height: media.size.height * .15,
                                          width: media.size.width * .43,
                                          child: CustomTextfield(
                                            hintTxt: "Pick a strong password",
                                            fColor: Colors.white10,
                                            validate: (value){
                                              if (value == "" || value!.length < 5){
                                                return "Please enter valid Password(length must be 6 characters)!";
                                              }
                                              return null;
                                            },
                                          )),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                          hSpacer(mHeight: 40.0),


                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: media.size.height * .15,
                            child: CustomElevatedButtton(
                                onTap: ()async{
                                  //if and if user is Authenticated
                                  if(landscapeKey.currentState!.validate()){
                                    var check =
                                    await Appdatabase().resetPassword(passwordController.text, widget.email);
                                    if(check){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                                    }
                                  }



                                },
                                bgColor: AppColors.PinkColor,
                                title: "Continue",
                                fSize: 20,
                                fWeight: FontWeight.w700,
                                fColor: AppColors.WhiteColor),
                          ),
                        ],
                      ),







                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
