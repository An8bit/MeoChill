import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/movie.dart';

import 'package:meochill/repostsitories/size_contanst.dart';
import 'package:meochill/widget/screens/search/cubit/search_cubit.dart';
import 'package:meochill/widget/screens/search/cubit/search_state.dart';
import 'package:meochill/widget/screens/search/widget/search_tiltle.dart';
import 'package:meochill/widget/screens/search/widget/top_search_item.dart';

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTiltleText(title: "Top Search"),
      kHeight20,
      Expanded(child:
          BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        if (state.loadStatus == LoadStatus.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.loadStatus == LoadStatus.Error) {
          return const Center(
            child: Text("Error "),
          );
        } else  {
          return ListView.separated(
              shrinkWrap: true,
              itemCount: state.movies.length,
              separatorBuilder: (context, index) => kHeight20,
              itemBuilder: (context, index) {
                final movies = state.movies[index];
                return TopSearchItemTitle(
                  id: "no ",
                  imageUrl: movies.posterurl!,
                  title: movies.name!,
                );
              });
        }
          
      }))
    ]);
  }
}
