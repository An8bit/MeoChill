
import 'package:flutter/material.dart';
import 'package:meochill/screens/home/home2_screen.dart';

import 'package:meochill/screens/Splash/splash.dart';
import 'package:meochill/screens/login/login_screen.dart';
import 'package:meochill/screens/login/register_screen.dart';

Route<dynamic>? mainRoute (RouteSettings settings)=> switch(settings.name){
       
    LoginScreen.route => MaterialPageRoute(builder: (context)=> const LoginScreen()),
  
    RegisterScreen.route => MaterialPageRoute(builder: (context)=> RegisterScreen()),
    
    splash_Screen.route=>MaterialPageRoute(builder: (context)=>splash_Screen()),
    HomeScreen2.route=>MaterialPageRoute(builder: (context)=>const HomeScreen2()),
    
    _ => MaterialPageRoute(builder: (context)=>  splash_Screen())
};