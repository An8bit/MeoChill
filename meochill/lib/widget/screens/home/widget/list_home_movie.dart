import 'dart:js';

import 'package:flutter/material.dart';
import 'package:meochill/repostsitories/size_contanst.dart';
import 'package:meochill/widget/screens/home/widget/main_item.dart';
import 'package:meochill/widget/screens/home/widget/title_body.dart';

import '../../../../generated/l10n.dart';
import '../../../../models/movie.dart';

class ListHomeMovies extends StatelessWidget {
  const ListHomeMovies({
    super.key,
    required this.listtoptrending,
    required this.listrecommand,
  });
  final List<Movie> listtoptrending;
  final List<Movie> listrecommand;
  
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Container(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TitleBody(title: S.of(context).titleHomeList,),
            SizedBox(
              height: 250,
              child: MainItem(nowShowingMovies: listtoptrending),
            ),
             TitleBody(title: S.of(context).titleHomeListbottom),
            SizedBox(
              height: 250,
              child: MainItem(nowShowingMovies: listrecommand),
            ),
          ],
             ),
       ),
     );
  }
}






