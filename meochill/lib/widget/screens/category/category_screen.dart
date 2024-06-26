import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyfavoriteScreen extends StatelessWidget {
  const MyfavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Image(image: AssetImage('assets/notfound.png'))),
    );
  }
}