import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/screens/search/widget/main_card.dart';
import 'package:meochill/widget/screens/search/widget/search_tiltle.dart';

import '../../../../repostsitories/size_constants.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';


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
               if (state.loadStatus==LoadStatus.Error || state.movies.isEmpty) {
          return const Center(child: Text("No results found"));
        }
            return GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.4,
              shrinkWrap: true,
              children: List.generate(state.movies.length, (index) {
                final movie = state.movies[index];
                return const MainCard(
                  id: "id",
                  imageUrl: "",
                );
              }),
            );
          },
        ))
      ],
    );
  }
}