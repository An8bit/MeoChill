
import 'package:flutter/material.dart';
import 'package:meochill/widget/screens/home/home_screen.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';
import 'package:meochill/widget/screens/register/register_screen.dart';
import 'package:meochill/widget/screens/search/search_screen.dart';

Route<dynamic>? mainRoute (RouteSettings settings)=> switch(settings.name){
    LoginScreen.route => MaterialPageRoute(builder: (context)=> LoginScreen()),
    HomeScreen.route => MaterialPageRoute(builder: (context)=> HomeScreen()),
    RegisterScreen.route => MaterialPageRoute(builder: (context)=> RegisterScreen()),
    SearchScreen.route => MaterialPageRoute(builder: (context) => SearchScreen()),
    
    _ => MaterialPageRoute(builder: (context)=> LoginScreen())
};