

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meochill/screens/navigationbar/film_Screen.dart';
import 'package:meochill/screens/search/search_screen.dart';

class HomeScreen2 extends StatefulWidget {
  static const String route  = "HomeScreen2";
  const HomeScreen2({super.key, this.index,});
   final int? index;
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _selectedIndex = 0;
  @override
  void initState() {
   if(widget.index !=null){
    _selectedIndex = widget.index!;
   }
    super.initState();
  }
   final _destinations = [
        const NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        const NavigationDestination(icon: Icon(Icons.search), label: 'search'),
        const NavigationDestination(icon: Icon(Icons.category), label: 'category'),
        const NavigationDestination(icon: Icon(Icons.settings), label: 'setting'),
   ];
   final _Screens = const [
     filmScreen(),
     SearchScreen(),
     Center(child: Text('Catogories Screen '),),
     Center(child: Text('Settings Screen '),),
   ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:_Screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation:10 ,
        backgroundColor:Theme.of(context).dialogBackgroundColor,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value){
          setState(() {
            _selectedIndex = value;
          });
        },
      
      ),
    );
  }
}