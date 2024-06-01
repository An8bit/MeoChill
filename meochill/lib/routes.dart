
import 'package:flutter/material.dart';
import 'package:meochill/screens/details/details_screen.dart';
import 'package:meochill/screens/details/video_screen.dart';
import 'package:meochill/screens/home/home_screen.dart';
import 'package:meochill/screens/login/login_screen.dart';
import 'package:meochill/screens/login/register_screen.dart';

Route<dynamic>? mainRoute (RouteSettings settings)=> switch(settings.name){
    LoginScreen.route => MaterialPageRoute(builder: (context)=> LoginScreen()),
    HomeScreen.route => MaterialPageRoute(builder: (context)=> HomeScreen()),
    RegisterScreen.route => MaterialPageRoute(builder: (context)=> RegisterScreen()),
   
    
    _ => MaterialPageRoute(builder: (context)=> LoginScreen())
};