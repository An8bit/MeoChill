
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meochill/widget/screens/home/home_screen.dart';
import 'package:meochill/widget/screens/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String route  = "HomeScreen2";
  const HomeScreen({super.key, this.index,});
   final int? index;
  @override
  State<HomeScreen> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen> {
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
     Expanded(child: filmScreen()),
     SearchScreen(),
     Center(child: Text('Catogories Screen '),),
     Center(child: Text('Settings Screen '),),
   ];


  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body:_Screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation:10 ,
        backgroundColor: darkMode ? Colors.black : Colors.white,
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
class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}