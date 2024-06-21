import 'package:flutter/material.dart';

import '../../../../repostsitories/size_constants.dart';
import '../../home/home_screen.dart';


class TopSearchItemTitle extends StatelessWidget {
  const TopSearchItemTitle({super.key, required this.id, required this.imageUrl, required this.title});
   final String id;
    final String imageUrl;
    final String title;
  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
    return Row(
       children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,MaterialPageRoute(builder: (context)=> HomeScreen()),
            );
          },
          child:  Container(
            width: screenwith*0.35,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl

                ),
                fit: BoxFit.cover,
              ),
            ),

          ),
        ),
        kWidth,
        Expanded(
          child:  Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        ),
       
       ],
    );
  }
}