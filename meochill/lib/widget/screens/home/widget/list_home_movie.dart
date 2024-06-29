import 'package:flutter/material.dart';
import 'package:meochill/repostsitories/size_contanst.dart';
import 'package:meochill/widget/screens/home/widget/main_item.dart';
import 'package:meochill/widget/screens/home/widget/title_body.dart';

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
            const TitleBody(title: "POPULAR"),
            SizedBox(
              height: 250,
              child: MainItem(nowShowingMovies: listtoptrending),
            ),
            const TitleBody(title: "RECOMMAND"),
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






