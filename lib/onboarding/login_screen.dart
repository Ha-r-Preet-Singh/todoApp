import 'package:flutter/material.dart';
import 'package:note_bloc_app/database_provider/app_database.dart';
import 'package:note_bloc_app/models/user_models.dart';
import 'package:note_bloc_app/onboarding/forget_password.dart';
import 'package:note_bloc_app/onboarding/signup_screeen.dart';
import 'package:note_bloc_app/screens/custom/custom_container.dart';
import 'package:note_bloc_app/screens/custom/custom_elevatedButtton.dart';
import 'package:note_bloc_app/screens/custom/custom_text.dart';
import 'package:note_bloc_app/screens/custom/custom_textfield.dart';
import 'package:note_bloc_app/screens/splash%20screen/splash_screen.dart';
import 'package:note_bloc_app/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/custom/custom_container2.dart';
import '../screens/home/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                  child: Form(
                    key: portraitKey,
                    child: Column(

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
                              title: "Log in",
                              fSize: 40,
                              fWeight: FontWeight.bold,
                              fColor: Colors.white,
                              fFamily: "montbold",
                            ),
                          ],
                        ),
                        hSpacer(mHeight: 70.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Log in with one of following options.",
                              fSize: 15,
                              fWeight: FontWeight.w900,
                              fColor: Colors.grey.shade400,
                              fFamily: "mont",
                            ),
                            hSpacer(mHeight: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomContainer2(
                                  mHeight: 65,
                                  mWidth: 150,
                                  cColor: Colors.white10,
                                  cRadius: BorderRadius.circular(20),
                                  BorderColor: AppColors.WhiteColor,
                                  cImage: NetworkImage(
                                      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                                      scale: 13),
                                ),
                                wSpacer(mWeight: 65.0),
                                CustomContainer2(
                                  mHeight: 65,
                                  mWidth: 150,
                                  cColor: Colors.white10,
                                  cRadius: BorderRadius.circular(20),
                                  BorderColor: AppColors.WhiteColor,
                                  cImage: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png",
                                      scale: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        hSpacer(mHeight: 40.0),


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
                            CustomTextfield(
                                hintTxt: "xyz@gmail.com",
                                fColor: Colors.white10,
                              validate: (value){
                                  if (value == "" || !value!.contains("@")){
                                    return "Please enter valid email!";
                                  }
                                  return null;
                              },
                            )],
                        ),
                        hSpacer(),
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
                                hintTxt: "Pick a strong password",
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
                        hSpacer(
                          mHeight: 80.0,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                          },
                          child: CustomText(
                            title: "Forget Password?",
                            fSize: 18,
                            fWeight: FontWeight.bold,
                            fColor: Colors.white,
                            fFamily: "montbold",
                          ),
                        ),
                        hSpacer(
                          mHeight: 20.0,
                        ),
                        CustomElevatedButtton(
                            onTap: ()async{
                              if(portraitKey.currentState!.validate()){
                                var check =
                                await Appdatabase().authenticateUser(
                                    email: emailController.text,
                                    password: passwordController.text
                                );

                                if(check){
                                  var prefs = await SharedPreferences.getInstance();
                                  prefs.setBool(SplashScreenState.LOGIN_KEY, true);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));


                                }else{
                                  //show error
                                }


                              }

                            },
                            bgColor: AppColors.PinkColor,
                            title: "Log in",
                            fSize: 20,
                            fWeight: FontWeight.w700,
                            fColor: AppColors.WhiteColor),
                        hSpacer(
                          mHeight: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: "Don't have an account?",
                              fSize: 15,
                              fWeight: FontWeight.w900,
                              fColor: Colors.grey.shade400,
                              fFamily: "mont",
                            ),
                            wSpacer(),
                            CustomText(
                              title: "Sign up",
                              fSize: 18,
                              fWeight: FontWeight.bold,
                              fColor: Colors.white,
                              fFamily: "montbold",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: Form(
                    key: landscapeKey,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [


                        Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
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
                              title: "Log in",
                              fSize: 40,
                              fWeight: FontWeight.bold,
                              fColor: Colors.white,
                              fFamily: "montbold",
                            ),
                          ],
                        ),
                        hSpacer(mHeight: 20.0),
                        Row(
                          children: [
                            CustomText(
                              title: "Log in with one of following options.",
                              fSize: 15,
                              fWeight: FontWeight.w900,
                              fColor: Colors.grey.shade400,
                              fFamily: "mont",
                            ),

                            wSpacer(mWeight: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomContainer2(
                                  mHeight: 65,
                                  mWidth: 250,
                                  cColor: Colors.white10,
                                  cRadius: BorderRadius.circular(20),
                                  BorderColor: AppColors.WhiteColor,
                                  cImage: NetworkImage(
                                      "https://cdn2.downdetector.com/static/uploads/logo/Google-new_19.png",
                                      scale: 6),
                                ),
                                wSpacer(mWeight: 40.0),
                                CustomContainer2(
                                  mHeight: 65,
                                  mWidth: 250,
                                  cColor: Colors.white10,
                                  cRadius: BorderRadius.circular(20),
                                  BorderColor: AppColors.WhiteColor,
                                  cImage: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png",
                                      scale: 20),
                                ),
                              ],
                            ),


                          ],
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
                        hSpacer(
                          mHeight: 10.0,
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height: media.size.height * .15,
                                child: CustomElevatedButtton(
                                  onTap: ()async{
                                    if(landscapeKey.currentState!.validate()){
                                      var check =
                                      await Appdatabase().authenticateUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                      );

                                      if(check){
                                       var prefs = await SharedPreferences.getInstance();
                                       prefs.setBool(SplashScreenState.LOGIN_KEY, true);
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

                                      }else{
                                        //show error
                                      }


                                    }
                                  },
                                    bgColor: AppColors.PinkColor,
                                    title: "Log in",
                                    fSize: 20,
                                    fWeight: FontWeight.w700,
                                    fColor: AppColors.WhiteColor
                                )),
                            hSpacer(),
                            Row(

                              children: [
                                Row(



                                  children: [
                                    CustomText(
                                      title: "Don't have an account?",
                                      fSize: 15,
                                      fWeight: FontWeight.w900,
                                      fColor: Colors.grey.shade400,
                                      fFamily: "mont",
                                    ),
                                    wSpacer(),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                      },
                                      child: CustomText(
                                        title: "Sign up",
                                        fSize: 18,
                                        fWeight: FontWeight.bold,
                                        fColor: Colors.white,
                                        fFamily: "montbold",
                                      ),
                                    ),
                                  ],
                                ),
                                wSpacer(mWeight: 200.0),

                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                                      },
                                      child: CustomText(
                                        title: "Forget Password?",
                                        fSize: 18,
                                        fWeight: FontWeight.bold,
                                        fColor: Colors.white,
                                        fFamily: "montbold",
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),



                          ],
                        ),



                      ],
                    ),
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

