
import 'package:flutter/material.dart';

import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';
import 'package:meochill/widget/screens/register/register_screen.dart';
import 'package:meochill/widget/screens/splash/splash.dart';

Route<dynamic>? mainRoute (RouteSettings settings)=> switch(settings.name){
       
    LoginScreen.route => MaterialPageRoute(builder: (context)=> const LoginScreen()),
   
    RegisterScreen.route => MaterialPageRoute(builder: (context)=> const RegisterScreen()),
    
    SplashScreen.route=>MaterialPageRoute(builder: (context)=>SplashScreen()),
    HomeScreen.route=>MaterialPageRoute(builder: (context)=>const HomeScreen()),
    _ => MaterialPageRoute(builder: (context)=>  SplashScreen())
};