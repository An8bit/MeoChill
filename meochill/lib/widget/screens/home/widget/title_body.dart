import 'package:flutter/material.dart';

class TitleBody extends StatelessWidget {
  const TitleBody( {
     super.key,required this.title,
  });
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return   Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 16.0), //
          child:   Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
             
            ),
          ),
        );
  
}}