import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_bloc_app/bloc/todo_bloc.dart';
import 'package:note_bloc_app/onboarding/signup_screeen.dart';
import 'package:note_bloc_app/screens/splash%20screen/splash_screen.dart';

import 'onboarding/login_screen.dart';

void main() {
  runApp(BlocProvider(create: (context) => TodoBloc(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,

      home:SplashScreen(),
    ),
  ));
}
