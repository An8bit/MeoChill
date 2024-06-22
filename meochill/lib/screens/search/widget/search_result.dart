import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/size_contanst.dart';
import 'package:meochill/screens/search/cubit/search_cubit.dart';
import 'package:meochill/screens/search/cubit/search_state.dart';
import 'package:meochill/screens/search/widget/main_card.dart';
import 'package:meochill/screens/search/widget/search_tiltle.dart';

import '../../../models/movie2.dart';
 
 
class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTiltleText(title: "Movies & TV"),
        kHeight20,
        Expanded(child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
               if (state.movies.isNotEmpty) {
                return GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.4,
              shrinkWrap: true,
              children: List.generate(state.movies.length, (index) {
                final movie = state.movies [index];
                 return  MainCard(
                  id: "id",
                  imageUrl:movie.thumburl ?? 'default_image_url',
                );
              }),
            );
        }
     return const Center(child: Text("No results found"));
          },
        ))
      ],
    );
  }
}