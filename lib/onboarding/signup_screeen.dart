import 'package:flutter/material.dart';
import 'package:note_bloc_app/database_provider/app_database.dart';
import 'package:note_bloc_app/models/user_models.dart';
import 'package:note_bloc_app/onboarding/login_screen.dart';
import 'package:note_bloc_app/screens/custom/custom_container.dart';
import 'package:note_bloc_app/screens/custom/custom_elevatedButtton.dart';
import 'package:note_bloc_app/screens/custom/custom_text.dart';
import 'package:note_bloc_app/screens/custom/custom_textfield.dart';
import 'package:note_bloc_app/screens/splash%20screen/splash_screen.dart';
import 'package:note_bloc_app/ui_helper.dart';

import '../screens/custom/custom_container2.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
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
                              title: "Sign up",
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
                              title: "Sign up with one of following options.",
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
                              title: "Name",
                              fSize: 18,
                              fWeight: FontWeight.bold,
                              fColor: Colors.white,
                              fFamily: "montbold",
                            ),
                            hSpacer(),
                            CustomTextfield(
                              hintTxt: "Enter Your Name",
                              fColor: Colors.white10,
                              validate: (value) {},
                            ),
                          ],
                        ),
                        hSpacer(),
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
                              validate: (value) {
                                if (value == "" || !value!.contains("@")) {
                                  return "Please enter valid email!";
                                }
                                return null;
                              },
                            ),
                          ],
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
                              validate: (value) {
                                if (value == "" || value!.length < 5) {
                                  return "Please enter valid Password(length must be 6 characters)!";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        hSpacer(
                          mHeight: 30.0,
                        ),
                        CustomElevatedButtton(
                            onTap: () async {
                              if (portraitKey.currentState!.validate()) {
                                var check = await Appdatabase().createUser(
                                    UserModel(
                                        email: emailController.text,
                                        password: passwordController.text));

                                if (check) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                } else {
                                  //show error
                                }
                              }
                            },
                            bgColor: AppColors.PinkColor,
                            title: "Create Account",
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
                              title: "Already have an account?",
                              fSize: 15,
                              fWeight: FontWeight.w900,
                              fColor: Colors.grey.shade400,
                              fFamily: "mont",
                            ),
                            wSpacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              },
                              child: CustomText(
                                title: "Log in",
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
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
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
                                  title: "Sign up",
                                  fSize: 40,
                                  fWeight: FontWeight.bold,
                                  fColor: Colors.white,
                                  fFamily: "montbold",
                                ),
                              ],
                            ),
                            wSpacer(
                              mWeight: 105.0,
                            ),
                            Column(
                              children: [
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
                                hSpacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      title: "Already have an account?",
                                      fSize: 15,
                                      fWeight: FontWeight.w900,
                                      fColor: Colors.grey.shade400,
                                      fFamily: "mont",
                                    ),
                                    wSpacer(),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                      },
                                      child: CustomText(
                                        title: "Email",
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
                        hSpacer(
                          mHeight: 2.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Name",
                              fSize: 18,
                              fWeight: FontWeight.bold,
                              fColor: Colors.white,
                              fFamily: "montbold",
                            ),
                            hSpacer(),
                            SizedBox(
                                height: media.size.height * .15,
                                child: CustomTextfield(
                                  hintTxt: "Enter Your Name",
                                  fColor: Colors.white10,
                                  validate: (value) {},
                                )),
                          ],
                        ),
                        hSpacer(),
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
                                      validate: (value) {
                                        if (value == "" ||
                                            !value!.contains("@")) {
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
                                      validate: (value) {
                                        if (value == "" || value!.length < 5) {
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
                        SizedBox(
                            height: media.size.height * .15,
                            child: CustomElevatedButtton(
                                onTap: () async {
                                  if (landscapeKey.currentState!.validate()) {
                                    var check = await Appdatabase().createUser(
                                        UserModel(
                                            email: emailController.text,
                                            password: passwordController.text));

                                    if (check) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    } else {
                                      //show error
                                    }
                                  }
                                },
                                bgColor: AppColors.PinkColor,
                                title: "Create Account",
                                fSize: 20,
                                fWeight: FontWeight.w700,
                                fColor: AppColors.WhiteColor)),
                        hSpacer(
                          mHeight: 10.0,
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
