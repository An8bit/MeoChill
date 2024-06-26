
import 'package:flutter/material.dart';
import 'package:meochill/widget/screens/details/details_screen.dart';
import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';
import 'package:meochill/widget/screens/register/register_screen.dart';
import 'package:meochill/widget/screens/splash/splash.dart';
import 'package:meochill/widget/screens/details/details_screen.dart';
Route<dynamic>? mainRoute (RouteSettings settings)=> switch(settings.name){
       
    LoginScreen.route => MaterialPageRoute(builder: (context)=>  LoginScreen()),
   // MovieDetailScreen.route => MaterialPageRoute(builder: (context)=>  MovieDetailScreen()),
    RegisterScreen.route => MaterialPageRoute(builder: (context)=> RegisterScreen()),
    
    SplashScreen.route=>MaterialPageRoute(builder: (context)=>SplashScreen()),
    HomeScreen.route=>MaterialPageRoute(builder: (context)=>HomeScreen()),
    MovieDetailScreen.route=>MaterialPageRoute(builder: (context)=>MovieDetailScreen()),
    _ => MaterialPageRoute(builder: (context)=>  SplashScreen())
};