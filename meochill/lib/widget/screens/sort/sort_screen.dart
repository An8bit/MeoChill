import 'package:flutter/material.dart';
import 'package:meochill/widget/screens/sort/tab_controller.dart';

class SortScreen extends StatelessWidget {
  const SortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Movies World"),
      ),
      body: const CustomTabBar(),
    );
  }
}
